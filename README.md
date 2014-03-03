# Rock-Paper-Scissors Tournament

Rock-paper-scissors (RPS), known as じゃんけん in Japanese, is a simple game where players make their hand into one of three shapes: rock, paper, or scissors. Rock beats scissors. Paper beats rock. Scissors beats paper. Anything else is a draw.

This exercise will be a tournament of RPS. You'll create a player that will compete against other predefined players over a series of matches. The predefined players will play in an exploitable manner, so your goal will be to create a player to counter their weaknesses.

## The tournament

Each pair of Player classes compete in a game of 1000 rounds of RPS. At the beginning of each game, an instance of the Player class will be created and the same instance will be used throughout the game.

After each pair has competed, the Player classes will then be ranked by their average score: wins count for 1, ties 0.5, and losses 0.

## Defining a player

Create a Player class in the `players` directory. To avoid naming collisions, use both team members github handle followed by Player. For example, PwimMreinschPlayer. Or be creative and come up with a team name instead.

Each player class should define two methods as follows

``` ruby
class PwimMreinschPlayer < RpsTournament::Player
  # return one of :rock, :paper, or :scissors
  def choose
  end

  # my_choice and oppontent_choice are one of :rock, :paper, or :scissors
  # result is one of :win, :lose, :draw
  def result(my_choice, opponent_choice, result)
  end
end
```

The choose method is called at the beginning of the round, while the result method is called at the end.

See [lib/rps_tournament/game.rb](lib/rps_tournament/game.rb) for details of how the methods are invoked.

## Running the tournament

Running `./bin/rps_tournament` without any options to run the basic tournament.

The program takes two optional arguments.

You can run it with a specific player name to get a detailed report on that players performance.

```
./bin/rps_tournament RandomPlayer
```

You can also supply it with the number of iterations.

```
./bin/rps_tournament 100
```
