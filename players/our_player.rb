class OurPlayer < RpsTournament::Player
  def initialize
    @choice = RpsTournament::Game::CHOICES.sample
    @strategy = BeforeWinStrategy.new
  end

  def choose
    @choice
  end

  def result(my_choice, opponent_choice, result)
    @choice = @strategy.calc(opponent_choice, result)
  end
end

class BeforeWinStrategy
  def calc(opponent_choice, result)
    case opponent_choice
    when :rock
      :paper
    when :paper
      :scissors
    when :scissors
      :rock
    end
  end
end
