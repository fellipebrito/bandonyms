require 'spec_helper'

describe Game do
  it 'initializes correct' do
    game = Game.new 'King', 'Queen'
    expect(game.secret).to eql 'King'
    expect(game.band).to eql 'Queen'
  end

  describe '#right_answer?' do
    it 'is the correct answer' do
      game = Game.new 'King', 'Queen'
      game.guess 'Queen'
      expect(game.right_answer?).to be_true
    end

    it 'is the wrong answer' do
      game = Game.new 'King', 'Queen'
      game.guess 'Pawn'
      expect(game.right_answer?).to be_false
    end
  end

  describe '#count_tries' do
    it 'exceeded the limit of tries' do
      game = Game.new 'King', 'Queen'
      game.tries = 4
      game.guess 'Pawn'
      game.right_answer?
      expect(game.message).to eql 'You already tried 5 time(s). Game over. Go home, you are drunk'
    end
  end
end
