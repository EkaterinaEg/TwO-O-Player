class Player
  attr_reader :name, :life #getter to use in game

  # attr_accessor :life
  NUMBER_OF_Lives = 3

  def initialize(name)
    @name = name
    @life = NUMBER_OF_Lives 
  end

  def died
    @life -= 1

  end

  def winner?
    @life > 0
  end
end
  