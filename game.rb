require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove.rb'
class Game
 attr_reader :title
 attr_reader :players

  def initialize(title)
    @title = title
    @players = []
  end

  def load_players(filename)
    File.readlines(filename).each do |line|
      puts line
      name, health = line.split(',')
      player = Player.new(name, Integer(health))
      add_player(player)
    end
  end

  def list_players
    @players.each do |player|
      puts "\t#{player}"
    end
  end

  def sorted_players
    puts "\n#{@title} High Scores!"
    players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name} #{player.score}"
    end
  end

  def add_player(a_players)
    @players << a_players
  end

  def total_points
  @players.reduce(0) { |sum, player| sum + player.points }
  end

  def print_stats
    strong_players = @players.select { |player| player.strong?}
    wimpy_players = @players.reject { |player| player.strong?}

    puts "\n#{@title} Statistics:"

    puts "\n#{strong_players.size} strong players:"
    strong_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    puts "\n#{wimpy_players.size} wimpy players:"
    wimpy_players.each do |player|
      puts "#{player.name} (#{player.health})"
    end

    @players.sort.each do |player|
      puts "\n#{player.name} total points:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end

    @players.each do |player|
      puts "\n\t#{player.name} has a total of #{player.points}"
    end
  end

  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}:"
    list_players
    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points."
    end
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def save_high_scores(to_file="highscores.txt")
    File.open(to_file, "w") do |file|
      file.puts "#{@title} High Scores"
      @players.sort.each do |player|
        formatted_name = player.name.ljust(20, '.')
        file.puts "#{formatted_name} #{player.score}"
      end
    end
  end
end
