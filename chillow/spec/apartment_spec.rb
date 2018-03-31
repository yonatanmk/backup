require 'spec_helper'

describe Apartment do
  subject(:apartment) {Apartment.new('77 Summer St.', 'Boston', '02110', 700, Date.parse('2016-12-21'), Date.parse('2017-12-01'), 2)}

  describe '#initialize' do
    it "accepts 7 arguments and initializes" do
      expect(apartment).to be_a(Apartment)
    end

    it "has an address" do
      expect(apartment.address).to eq('77 Summer St.')
    end

    it "has a city/town" do
      expect(apartment.city_or_town).to eq('Boston')
    end

    it "has a rent cost" do
      expect(apartment.rent).to eq(700)
    end

    it "has a lease start date" do
      expect(apartment.lease_start_date).to eq(Date.parse('2016-12-21'))
    end

    it "has a lease end date" do
      expect(apartment.lease_end_date).to eq(Date.parse('2017-12-01'))
    end

    it "has a maxmimum number of items" do
      expect(apartment.capacity).to eq(2)
    end

    it "has a no items initially" do
      expect(apartment.items).to be_a(Array)
      expect(apartment.items.length).to eq(0)
    end
  end

  describe '#full?' do
    it 'returns true if apartment is full' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      apartment.add_item(Occupant.new('Harry', 'Potter'))
      expect(apartment.full?).to eq(true)
    end

    it 'returns false if apartment is not full' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      expect(apartment.full?).to eq(false)
    end
  end

  describe '#empty?' do
    it 'returns false if apartment has items' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      expect(apartment.empty?).to eq(false)
    end

    it 'returns true if apartment is empty' do
      expect(apartment.empty?).to eq(true)
    end
  end

  describe '#add_item' do
    it 'adds a roomate when there is room' do
      roomate = Occupant.new('Severus', 'Snape')
      expect{apartment.add_item(roomate)}.to output("Severus Snape has moved in\n").to_stdout
      expect(apartment.items[0]).to eq(roomate)
    end

    it 'does not add roomate if apartment is full' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      apartment.add_item(Occupant.new('Harry', 'Potter'))
      expect{apartment.add_item(Occupant.new('Lily', 'Potter'))}.to output("It's full\n").to_stdout
      expect(apartment.items.length).to eq(2)
    end

    it 'doesnt add a roomate who already lives in apartment' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      expect{apartment.add_item(Occupant.new('Severus', 'Snape'))}.to output("Severus Snape already lives here silly!\n").to_stdout
      expect(apartment.items.length).to eq(1)
    end
  end

  describe '#remove_item' do
    it 'removes a roomate' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      expect{apartment.remove_item(Occupant.new('Severus', 'Snape'))}.to output("Severus Snape has left the apartment\n").to_stdout
      expect(apartment.items.length).to eq(0)
    end

    it 'shows error if person does not live there' do
      apartment.add_item(Occupant.new('Severus', 'Snape'))
      expect{apartment.remove_item(Occupant.new('Harry', 'Potter'))}.to output("That person isn't here\n").to_stdout
      expect(apartment.items.length).to eq(1)
    end

    it 'shows error if apartment is empty' do
      expect{apartment.remove_item(Occupant.new('Harry', 'Potter'))}.to output("It's empty\n").to_stdout
    end

  end


end
