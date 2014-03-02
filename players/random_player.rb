class RandomPlayer < RpsTournament::Player
  def choose
    [:rock, :paper, :scissors][rand(3)]
  end
end
