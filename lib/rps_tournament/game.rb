class RpsTournament::Game
  CHOICES = [:rock, :paper, :scissors]

  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
  end

  def play
    choice1 = @player1.choose
    raise "#{@player1} chose #{choice1.inspect}, which is invalid" unless CHOICES.include?(choice1)
    choice2 = @player2.choose
    raise "#{@player1} chose #{choice2.inspect}, which is invalid" unless CHOICES.include?(choice2)

    if choice1 == choice2
      @player1.result choice1, choice2, :draw
      @player2.result choice2, choice1, :draw
      nil
    else
      winner = case choice1
      when :rock
        case choice2
        when :paper
          player2
        when :scissors
          player1
        end
      when :paper
        case choice2
        when :rock
          player1
        when :scissors
          player2
        end
      when :scissors
        case choice2
        when :rock
          player2
        when :paper
          player1
        end
      end
      if winner == @player1
        win @player1, choice1, @player2, choice2
      else
        win @player2, choice2, @player1, choice1
      end
      winner
    end
  end

  private

  def win(winning_player, winning_choice, losing_player, losing_choice)
    winning_player.result winning_choice, losing_choice, :win
    losing_player.result losing_choice, winning_choice, :lose
  end
end
