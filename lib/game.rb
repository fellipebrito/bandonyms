class Game
  attr_accessor :answer, :clue, :tries, :message

  def initialize answer, clue
    @answer = answer
    @clue = clue
    @tries = 0
    @message = 'Let\'s play a game!'
  end

  def guess user_guess
    @tries += 1
    @guess = user_guess
  end

  def right_answer? user
    if @guess.downcase == @answer.downcase
      save_user_match user
      @message = 'Well Done bro'
      return true
    end

    count_tries
    false
  end

  def save_user_match user
    answer = Answer.find_by title: @answer
    Match.create user: user, answer: answer
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
