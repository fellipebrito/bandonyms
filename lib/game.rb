class Game
  attr_accessor :user, :answer, :clue, :tries, :message

  def initialize user, answer
    @user = user
    @answer = answer
    @clue = @answer.clues.first
    @tries = 0
    @message = 'Let\'s play a game!'
  end

  def guess user_guess
    @tries += 1
    @guess = user_guess
  end

  def right_answer?
    if @guess.downcase == @answer.title.downcase
      Match.create user: @user, answer: @answer
      @message = 'Well Done bro'
      return true
    end

    count_tries
    false
  end

  def count_tries
    @message = "You already tried #{@tries} time(s). "

    if @tries < 3
      @message += 'Try again!'
    else
      @message = 'Game over. Go home, you are drunk'
    end
  end
end
