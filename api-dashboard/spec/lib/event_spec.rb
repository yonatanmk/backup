require "spec_helper"

RSpec.describe Event do
  let(:event) { Event.new('name', 'venue', 'url', 'start time', 'type') }

  describe '#initialize' do
    it 'accepts 4 arguments and initializes correctly' do
      expect(event).to be_a(Event)
    end

    it 'has a name' do
      expect(event.name).to eq('name')
    end

    it 'has a venue' do
      expect(event.venue).to eq('venue')
    end

    it 'has a url' do
      expect(event.url).to eq('url')
    end

    it 'has a start time' do
      expect(event.start_time).to eq('start time')
    end

    it 'type' do
      expect(event.type).to eq('type')
    end
  end


end
