class OurPlayer < RpsTournament::Player
  def initialize
    @choice = RpsTournament::Game::CHOICES.sample
    @strategy = BeforeWinStrategy.new
    @results = []
  end

  def choose
    @choice
  end

  def result(my_choice, opponent_choice, result)
    @results << result
    @strategy = BeforeLoseStrategy.new if need_change_strategy?

    @choice = @strategy.calc(opponent_choice, result)
  end

  def need_change_strategy?
    latest_result = @results.last(5)
    @results.size == 5 && (
    @results.last(5).uniq == [:draw] ||
      @results.last(2) == [:lose, :win]
    )
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

class BeforeLoseStrategy
  def calc(opponent_choice, result)
    case opponent_choice
    when :rock
      :scissors
    when :paper
      :rock
    when :scissors
      :paper
    end
  end
end
