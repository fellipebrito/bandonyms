require 'spec_helper'

describe Game do
  let(:answer){ FactoryGirl.create(:answer) }

  it 'initializes correct' do
    game = Game.new answer.clues.first.title, answer.title
    expect(game.secret).to eql answer.clues.first.title
    expect(game.band).to eql answer.title
  end

  describe '#right_answer?' do
    it 'is the correct answer' do
      game = Game.new answer.clues.first.title, answer.title
      game.guess answer.title
      expect(game.right_answer?).to be_true
    end

    it 'is the wrong answer' do
      game = Game.new answer.clues.first.title, answer.title
      game.guess 'Pawn'
      expect(game.right_answer?).to be_false
    end
  end

  describe '#count_tries' do
    it 'exceeded the limit of tries' do
      game = Game.new answer.clues.first.title, answer.title
      game.tries = 2
      game.guess 'Pawn'
      game.right_answer?
      expect(game.message).to eql 'Game over. Go home, you are drunk'
    end
  end
end
