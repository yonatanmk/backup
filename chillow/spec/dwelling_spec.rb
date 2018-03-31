require 'spec_helper'

describe Dwelling do
  subject(:dwelling) {Dwelling.new('77 Summer St.', 'Boston', 'MA', '02110')}

  describe '#initialize' do
    it "accepts 4 arguments and initializes" do
      expect(dwelling).to be_a(Dwelling)
    end

    it "has an address" do
      expect(dwelling.address).to eq('77 Summer St.')
    end

    it "has a city/town" do
      expect(dwelling.city_or_town).to eq('Boston')
    end

    it "has an state" do
      expect(dwelling.state).to eq('MA')
    end

    it "has an zip code" do
      expect(dwelling.zip_code).to eq('02110')
    end
  end

end
