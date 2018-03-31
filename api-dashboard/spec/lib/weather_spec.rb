require "spec_helper"

RSpec.describe Weather, vcr: { cassette_name: "weather" } do
  let(:weather) { Weather.new(42.2848, -71.0741, ENV["DARKSKY_API_KEY"]) }

  describe '#initialize' do
    it 'takes lat, long, and key arguments and initializes correctly' do
      expect(weather).to be_a(Weather)
    end
  end

  describe "#summary" do
    it "returns the appropriate weather summary" do
      expect(weather.summary).to eq("Partly Cloudy")
    end
  end

  describe "#temp" do
    it "returns a Float" do
      expect(weather.temp).to be_a(Float)
    end

    it "returns the temperature" do
      expect(weather.temp).to eq(24.22)
    end
  end

  describe "#icon" do
    it "returns the appropriate weather summary" do
      expect(weather.icon).to eq("partly-cloudy-day")
    end
  end

end
