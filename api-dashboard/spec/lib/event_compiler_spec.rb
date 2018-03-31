require "spec_helper"

RSpec.describe Event_Compiler, vcr: { cassette_name: "event_compiler" } do
  let(:event_compiler) { Event_Compiler.new(42.2848, -71.0741, ENV["SEATGEEK_CLIENT_SECRET"], ENV["SEATGEEK_CLIENT_ID"]) }

  describe '#initialize' do
    it 'takes lat, long, and key arguments and initializes correctly' do
      expect(event_compiler).to be_a(Event_Compiler)
    end

    it "stores today's date as a string" do
      expect(event_compiler.date).to eq(Date.today.to_s[0..9])
    end

    it "@events contains events" do
      expect(event_compiler.events[0]).to be_a(Event)
    end

    it "@events contains at least 10 events" do
      expect(event_compiler.events[0]).to be_a(Event)
      expect(event_compiler.events.length >= 10).to eq(true)
    end
  end

end
