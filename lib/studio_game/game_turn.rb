require_relative "player"
require_relative "die"
require_relative "treasure_trove"
require_relative 'loaded_die'

module StudioGame
  module GameTurn

    def self.take_turn(player)
      die = Die.new
      number_rolled = die.roll
      case die.roll
        when 1..2
        "#{player.name} has been hit"
        player.hit
        when 5..6
        "#{player.name} has been healed"
        player.heal
        else
        "#{player.name} has been skipped"
      end
      treasure = TreasureTrove.random
      player.found_treasure(treasure)
    end
  end
end
