require 'spec_helper'

describe Box do
  let (:owner) {Occupant.new('Severus', 'Snape')}
  subject(:box) {Box.new(owner)}

  describe '#initialize' do
    it "accepts 1 argument and initializes" do
      expect(box).to be_a(Box)
    end

    it "has an owner" do
      expect(box.owner).to eq(owner)
    end

  end

end
