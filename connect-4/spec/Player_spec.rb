require_relative '../Player.rb'
# ♠ ♥ ♦ ♣



describe 'Player:' do
  subject(:player) {Player.new('Steve', 'X')}
  it "has a name" do
    expect(player.name).to eq('Steve')
  end

  it 'has a mark' do
    expect(player.mark).to eq('X')
  end
end
