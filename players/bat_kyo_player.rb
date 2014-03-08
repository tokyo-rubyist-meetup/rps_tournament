class BatKyoPlayer < RpsTournament::Player
  # return one of :rock, :paper, or :scissors
  def choose
  	now = Time.now.to_i
  	if now % 3
  		:paper
  	elsif now % 2
  		:rock
  	else
  		:scissors
  	end
  end

end
