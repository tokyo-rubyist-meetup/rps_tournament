class RpsTournament::Runner
  def initialize(args)
    Dir.glob(File.join(File.expand_path('../../../players', __FILE__), "*")) do |path|
      load path
    end
    args[0,2].each do |arg|
      if arg =~ /^\d+$/
        @iterations = arg.to_i
      elsif arg =~ /^[A-Z]\w+Player/ && Object.const_defined?(arg)
        @my_player = Object.const_get(arg)
      end
    end
    @iterations ||= 1000
  end

  def run
    log "Tournament with #{@iterations} iterations"
    log_line
    results = Hash.new {|h,k| h[k] = {}}
    RpsTournament::Player.each_pair do |player1_class, player2_class|
      player1, player2 = player1_class.new, player2_class.new
      game = RpsTournament::Game.new(player1, player2)
      @iterations.times { game.play }
      results[player1_class][player2_class] = game.player1_average
      results[player2_class][player1_class] = game.player2_average
    end
    scores = Hash.new(0.0)
    results.each do |player, match_results|
      match_results.each do |opponent, score|
        scores[player] += score / match_results.size
      end
    end
    scores.to_a.sort_by {|player,total_score| -total_score}.each do |player,total_score|
      log [player, as_percentage(total_score)].join(" - ")
    end
    if @my_player
      log_line
      log "Results for #{@my_player}"
      if my_results = results[@my_player]
        my_results.each_pair do |opponent, score|
          log " vs #{opponent}: #{as_percentage(score)}"
        end
      else
        log "Could not find player"
      end
    end
  end

  def as_percentage(score)
    (score*100).round(2)
  end

  def log(s)
    puts s
  end

  def log_line
    log "-" * 35
  end
end
