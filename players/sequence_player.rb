class SequencePlayer < RpsTournament::Player
  def initialize
    @sequence = [:paper, :rock, :scissors]
  end

  def choose
    @sequence.push @sequence.shift
    @sequence.first
  end
end
