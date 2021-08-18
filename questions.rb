class Questions
  attr_reader :new_question, :answer

  def initialize
    num1 = rand(1..20)
    num2 = rand(1..20)
    @new_question = "What is the sum of #{num1} plus #{num2} ?"
    @answer = num1 + num2
  end
end