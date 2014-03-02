class RpsTournament::Player
  class << self
    def players
      @players ||= []
    end

    def inherited(klass)
      players << klass
    end

    def each_pair
      (0...(players.size - 1)).each do |i|
        ((i + 1)...players.size).each do |j|
          yield players[i], players[j]
        end
      end
    end
  end

  def choose
  end

  def result(my_choice, opponent_choice, result)
  end

  def to_s
    self.class.to_s
  end
end
