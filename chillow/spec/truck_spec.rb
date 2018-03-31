require 'spec_helper'

describe Truck do
  subject(:truck) {Truck.new(2)}
  let (:owner) {Occupant.new('Severus', 'Snape')}
  let (:owner2) {Occupant.new('Harry', 'Potter')}
  let (:box) {Box.new(owner)}
  let (:box2) {Box.new(owner2)}

  describe '#initialize' do
    it "accepts 1 argument and initializes" do
      expect(truck).to be_a(Truck)
    end

    it "has a boxes array" do
      expect(truck.items).to eq([])
    end

    it "has a boxes capacity" do
      expect(truck.capacity).to eq(2)
    end

  end

  describe '#full?' do
    it 'returns true if truck is full' do
      truck.add_item(box)
      truck.add_item(box2)
      expect(truck.full?).to eq(true)
    end

    it 'returns false if apartment is not full' do
      truck.add_item(box)
      expect(truck.full?).to eq(false)
    end
  end

  describe '#empty?' do
    it 'returns false if apartment has occupants' do
      truck.add_item(box)
      expect(truck.empty?).to eq(false)
    end

    it 'returns true if apartment is empty' do
      expect(truck.empty?).to eq(true)
    end
  end

  describe '#add_item' do
    it 'adds a box when there is room' do
      truck.add_item(box)
      expect(truck.items.length).to eq(1)
      expect(truck.items[0]).to eq(box)
    end

    it 'does not add box if truck is full' do
      truck.add_item(box)
      truck.add_item(box2)
      expect{truck.add_item(box)}.to output("It's full\n").to_stdout
      expect(truck.items.length).to eq(2)
    end
  end

  describe '#remove_item' do
    it 'removes a box' do
      truck.add_item(box)
      expect(truck.items.length).to eq(1)
      truck.remove_item(box, 'box')
      expect(truck.items.length).to eq(0)
    end

    it 'shows error if box is not there' do
      truck.add_item(box)
      expect{truck.remove_item(box2, 'box')}.to output("That box isn't here\n").to_stdout
      expect(truck.items.length).to eq(1)
    end

    it 'shows error if truck is empty' do
      expect{truck.remove_item(box, 'box')}.to output("It's empty\n").to_stdout
    end
  end

  describe '#remove_all' do
    it 'removes all boxes of owner' do
      truck.add_item(box)
      truck.add_item(box)
      truck.remove_all(owner)
      expect(truck.items.length).to eq(0)
    end

    it 'removes only boxes of owner' do
      truck.add_item(box)
      truck.add_item(box2)
      truck.remove_all(owner)
      expect(truck.items.length).to eq(1)
    end
  end

end
