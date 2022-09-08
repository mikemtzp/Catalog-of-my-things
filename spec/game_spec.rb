require_relative '../classes/game'

describe Game do
  before :each do
    @game = Game.new('Tik-Tak-Toe', 'Michael', '2011-01-01', 'Y')
  end

  describe 'Add new game' do
    it 'should return @game as an instance of Game class' do
      expect(@game).to be_an_instance_of(Game)
    end
    it 'should return Y' do
      expect(@game.multiplayer).to eq 'Y'
    end
    it 'should return Michael' do
      expect(@game.author).to eq 'Michael'
    end
  end
end
