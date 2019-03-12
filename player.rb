require_relative 'treasure_trove'

class Player
  attr_reader :health
  attr_accessor :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasure = Hash.new(0)
  end

  def to_s
    "I'm #{@name}, with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def hit
    @health -= 10
    puts "\t#{@name} got hit!"
  end

  def heal
    @health += 15
    puts "\t#{@name} has been healed!"
  end

  def score
    @health + points
  end

  def strong?
    @health > 100
  end

  def <=>(other)
    other.score <=> score
  end

  def found_treasure(treasure)
    @found_treasure[treasure.name] += treasure.points
    puts "#{@name} has found a #{treasure.name} that is worth #{treasure.points} points"
    puts "#{@name}'s treasure: #{@found_treasure}'"
  end

  def points
  @found_treasure.values.reduce(0, :+)
  end

  def each_found_treasure
    @found_treasure.each do |name, points|
      yield Treasure.new(name, points)

    end
  end

end

if __FILE__ == $0
  player1 = Player.new("Moe", 90)
  puts player1.name
  puts player1.heal
  puts player1.hit
  puts player1
end
