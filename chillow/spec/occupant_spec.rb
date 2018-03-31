require 'spec_helper'

describe Occupant do
  subject(:occupant) {Occupant.new('Severus', 'Snape')}

  describe '#initialize' do
    it "accepts 2 arguments and initializes" do
      expect(occupant).to be_a(Occupant)
    end

    it "has a first name" do
      expect(occupant.first_name).to eq('Severus')
    end

    it "has a last name" do
      expect(occupant.last_name).to eq('Snape')
    end
  end

  describe '#same_person?' do
    it 'returns true if same person' do
      person = Occupant.new('Severus', 'Snape')
      expect(occupant.same_person?(person)).to eq(true)
    end

    it 'returns false if not same person' do
      person = Occupant.new('Harry', 'Potter')
      expect(occupant.same_person?(person)).to eq(false)
    end
  end

end
