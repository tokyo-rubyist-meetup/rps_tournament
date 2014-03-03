class ProbabilityPlayer < RpsTournament::Player
  CHOICES = ([:paper] * 100 + [:rock] * 300 + [:scissors] * 900).freeze
  def choose
    CHOICES[rand(CHOICES.size)]
  end
end
