class RpsTournament::Runner
  def initialize(args)
    @my_player = args.pop
    @iterations = 1000
  end

  def run
    Dir.glob(File.join(File.expand_path('../../../players', __FILE__), "*")) do |path|
      load path
    end
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
      puts [player, as_percentage(total_score)].join(" - ")
    end
    if @my_player
      puts "-" * 20
      puts "Results for #{@my_player}"
      if Object.const_defined?(@my_player) && (my_results = results[Object.const_get(@my_player)])
        my_results.each_pair do |opponent, score|
          puts " vs #{opponent}: #{as_percentage(score)}"
        end
      else
        puts "Could not find player"
      end
    end
  end

  def as_percentage(score)
    (score*100).round(2)
  end
end
