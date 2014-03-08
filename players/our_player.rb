class OurPlayer < RpsTournament::Player
  def initialize
    @choice = RpsTournament::Game::CHOICES.sample
  end

  def choose
    @choice
  end

  def result(my_choice, opponent_choice, result)
    @choice = case opponent_choice
    when :rock
      :paper
    when :paper
      :scissors
    when :scissors
      :rock
    end
  end
end
