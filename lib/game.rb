class Game
  attr_accessor :band, :secret, :tries, :message

  def initialize secret, band
    @secret = secret
    @band = band
    @tries = 0
    @message = 'Let\'s play a game!'
  end

  def user
    { 'name' => 'Fellipe Brito' }
  end

  def guess user_guess
    @tries += 1
    @guess = user_guess
  end

  def right_answer?
    if @guess.downcase == @band.downcase
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
