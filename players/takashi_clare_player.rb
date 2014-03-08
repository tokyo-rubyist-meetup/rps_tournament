class TakashiClarePlayer < RpsTournament::Player

  def initialize
    @last_opponent_choice = :rock
  end

  # return one of :rock, :paper, or :scissors
  def choose
    
    case @last_opponent_choice
      when :paper
        [:rock, :scissors][rand(2)]
      when :rock
        [:paper, :scissors][rand(2)]
      when :scissors
        [:rock, :scissors][rand(2)]
    end
    
    #:paper
    
    
  end

  # my_choice and oppontent_choice are one of :rock, :paper, or :scissors
  # result is one of :win, :lose, :draw
  def result(my_choice, opponent_choice, result)
    #puts "#{my_choice} #{opponent_choice} #{@last_opponent_choice} #{result}"
    @last_opponent_choice = opponent_choice
  end
  
end