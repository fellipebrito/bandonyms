require 'spec_helper'

describe Game do

  before(:all)do
    FactoryGirl.create(:user)
    FactoryGirl.create(:answer)
  end

  let(:answer) { Answer.first  }
  let(:user) { User.first  }
  let(:game) { Game.new answer.title, answer.clues.first.title }

  it 'initializes correct' do
    expect(game.answer).to eql answer.title
    expect(game.clue).to eql answer.clues.first.title
  end

  describe '#right_answer?' do
    it 'is the correct answer' do
      game.guess answer.title
      expect(game.right_answer? user).to be_true
    end

    it 'is the wrong answer' do
      game.guess 'Pawn'
      expect(game.right_answer? user).to be_false
    end
  end

  describe '#count_tries' do
    it 'exceeded the limit of tries' do
      game.tries = 2
      game.guess 'Pawn'
      game.right_answer? user
      expect(game.message).to eql 'Game over. Go home, you are drunk'
    end
  end
end
