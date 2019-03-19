require_relative '../studio_game/player'
require_relative '../studio_game/die'
require_relative '../studio_game/treasure_trove'
require_relative '../studio_game/loaded_die'

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
