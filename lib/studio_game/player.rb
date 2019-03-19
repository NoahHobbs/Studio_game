require_relative '../studio_game/treasure_trove'
require_relative '../studio_game/playable'

module StudioGame
  class Player
    include Playable
    attr_accessor :health
    attr_accessor :name

    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @found_treasure = Hash.new(0)
    end

    def to_s
      "I'm #{@name}, with health = #{@health}, points = #{points}, and score = #{score}."
    end

    def score
      @health + points
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
end
