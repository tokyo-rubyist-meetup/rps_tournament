class OurPlayer < RpsTournament::Player
  def choose
    [:paper, :scissors][rand 2]
  end
end
