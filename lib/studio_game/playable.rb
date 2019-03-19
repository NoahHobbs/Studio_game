module StudioGame
  module Playable
    def hit
      self.health -= 10
      puts "\t#{self.name} got hit!"
    end

    def heal
      @health += 15
      puts "\t#{self.name} has been healed!"
    end

    def strong?
      self.health > 100
    end
  end
end
