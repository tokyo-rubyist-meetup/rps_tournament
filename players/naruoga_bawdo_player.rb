class NaruogaBawdoPlayer < RpsTournament::Player

  @@results = [[:paper, :scissors, :lose]]
  OPTIONS = [:rock, :paper, :scissors]

  def choose
    last_result = @@results.last.last
    last_my_choice = @@results.last[0]
    last_opponent_choice = @@results.last[1]
    if last_result == :lose
      OPTIONS.sample
    elsif last_result == :win
      last_my_choice
    else
      (OPTIONS - [last_opponent_choice]).sample
    end
  end

  def result(my_choice, opponent_choice, result)
    @@results << [my_choice, opponent_choice, result]
  end
end
