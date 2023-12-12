class Question
  attr_reader :result #getter to use in game

  def initialize
    @number1 = rand(1...20)
    @number2 = rand(1...20)
    @result = @number1 + @number2
  end
  
  def generate_question
    "What does #{@number1} plus #{@number2} equal?"
  end
end
  