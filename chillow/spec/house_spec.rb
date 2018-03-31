require 'spec_helper'

describe House do
  subject(:house) {House.new('77 Summer St.', 'Boston', '02110', 2)}

  describe '#initialize' do
    it "accepts 4 arguments and initializes" do
      expect(house).to be_a(House)
    end

    it "has an address" do
      expect(house.address).to eq('77 Summer St.')
    end

    it "has a city/town" do
      expect(house.city_or_town).to eq('Boston')
    end

    it "has an zip code" do
      expect(house.zip_code).to eq('02110')
    end

    it "has an asking price" do
      expect(house.asking_price).to eq(2)
    end
  end

end
