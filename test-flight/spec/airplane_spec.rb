require_relative "../lib/airplane.rb"

describe Airplane do
  subject(:airplane) { airplane = Airplane.new('cesna',10,150, 100)}
  let(:running_plane) do
    running_plane = airplane
    running_plane.start
    running_plane
  end
  let(:flying_plane) do
    flying_plane = running_plane
    flying_plane.takeoff
    flying_plane
  end

  describe "#initialization" do
    it "takes type, wing loading, and horsepower as input and creates an Airplane class" do
      expect(airplane).to be_a(Airplane)
      expect(airplane.type).to eq('cesna')
      expect(airplane.wing_loading).to eq(10)
      expect(airplane.horsepower).to eq(150)
      expect(airplane.engine_running).to eq(false)
      expect(airplane.flying).to eq(false)
    end
  end

  describe "#start" do
    context 'engine not running' do
      it 'doesnt turn on without fuel' do
        expect(Airplane.new('cesna',10,150, 0).start).to eq("not enough fuel")
      end
      it 'turns on the engine' do
        expect(running_plane.engine_running).to eq(true)
      end
      it 'returns "engine was started"' do
        expect(airplane.start).to eq("engine was started")
      end
    end
    context 'engine already running' do
      it 'returns "engine already running"' do
        expect(running_plane.start).to eq("engine already running")
      end
    end
  end

  describe "#takeoff" do
    it 'doesnt takeoff without fuel' do
      test_plane = Airplane.new('cesna',10,150, 20)
      test_plane.start
      expect(test_plane.takeoff).to eq("not enough fuel")
    end
    it 'plane takes off if engine started' do
      expect(running_plane.takeoff).to eq('airplane launched')
      expect(flying_plane.flying).to eq(true)
    end
    it 'plane cant take off if engine not started' do
      expect(airplane.takeoff).to eq('airplane not started, please start')
    end
  end

  describe "#land" do
    it 'returns "airplane not started, please start" if engine not running' do
      expect(airplane.land).to eq("airplane not started, please start")
    end
    it 'returns "airplane already on the ground" if plane started, but not flying' do
      expect(running_plane.land).to eq("airplane already on the ground")
    end
    it 'returns "airplane landed" if plane is flying' do
      expect(flying_plane.land).to eq("airplane landed")
    end
    it 'sets flying to false if plane is flying' do
      test_plane = flying_plane.land
      expect(airplane.flying).to eq(false)
    end
  end

end
