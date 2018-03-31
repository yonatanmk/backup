class Folder
  FOLDERS_JSON_FILE = File.dirname(__FILE__) + '/folders.json'

  class << self
    attr_accessor :latest_id

    def all
      folders_data_string = File.read(FOLDERS_JSON_FILE)
      folders_data = JSON.parse(folders_data_string)
      folder_hashes = folders_data["folders"]
      folder_hashes.map { |folder_hash| Folder.new(folder_hash) }
    end #returns array of folder objects

    def next_id
      self.latest_id += 1
    end

    def find_by(attributes)
      all.find do |folder|
        attributes.all? do |attribute, attribute_value|
          folder.send(attribute) == attribute_value
        end
      end
    end #returns folder with passed in atrributes

    private

    def get_latest_id_from_folders_json
      if all.empty?
        self.latest_id = 0
      else
        self.latest_id = all.max_by(&:id).id
      end
    end
  end  #ends class methods

  attr_accessor :id
  attr_reader :name

  def initialize(attributes)
    @id = attributes["id"]
    @name = attributes["name"]
  end


  def errors
    @errors ||= {}
  end

  def to_hash
    {
      id: id,
      name: name
    }
  end

  def to_json(_)
    to_hash.to_json
  end

  def notes #returns notes that contain id
    Note.where(folder_id: id)
  end

  def save
    if valid?
      self.id = Folder.next_id  #makes id 1 more than the latest folder Id
      folders = Folder.all
      folders.push(self)
      overwrite_folders_json(folders) #updates folders json to include new folder
      true
    else
      false
    end
  end

  def valid?  #returns true if notes has a valid name
    if name.nil? || (name && name.empty?)
      errors[:name] ||= []
      errors[:name] << "can't be blank"
    end

    errors.empty?
  end

  get_latest_id_from_folders_json

  private

  def overwrite_folders_json(folders)
    folders.map!(&:to_hash)
    folders_data = { folders: folders }
    folders_data_string = JSON.pretty_generate(folders_data, indent: "  ")
    File.write(FOLDERS_JSON_FILE, folders_data_string)
  end
end
