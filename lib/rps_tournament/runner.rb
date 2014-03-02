class RpsTournament::Runner
  def initialize(args)
    @my_player = args[0]
  end

  def run
    Dir.glob(File.join(File.expand_path('../../../players', __FILE__), "*")) do |path|
      load path
    end
    iterations = 10000
    results = Hash.new {|h,k| h[k] = Hash.new(0)}
    RpsTournament::Player.each_pair do |player1_class, player2_class|
      player1, player2 = player1_class.new, player2_class.new
      game = RpsTournament::Game.new(player1, player2)
      iterations.times do
        winner = game.play
        if winner
          results[player1_class][player2_class] += winner == player1 ? 1 : 0
          results[player2_class][player1_class] += winner == player2 ? 1 : 0
        else
          results[player1_class][player2_class] += 0.5
          results[player2_class][player1_class] += 0.5
        end
      end
    end
    scores = results.map do |player, match_results|
      [player, match_results.inject(0) {|sum,(opponent, score)| sum + score / iterations} / match_results.size, match_results]
    end
    scores.sort_by {|player,total_score, results| -total_score}.each do |player,total_score,results|
      puts [player, (total_score*100).round(2)].join(" - ")
    end
    if @my_player
      puts "-" * 20
      puts "Results for #{@my_player}"
      if Object.const_defined?(@my_player) && (my_results = results[Object.const_get(@my_player)])
        my_results.each_pair do |opponent, score|
          puts " vs #{opponent}: #{score}"
        end
      else
        puts "Could not find player"
      end
    end
  end
end
