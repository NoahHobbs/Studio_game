require_relative 'player'

module StudioGame    
  class BerserkPlayer < Player
    def initialize(name, health=100)
      super(name, health)
      @heal_count = 0
    end

    def berserk?
      @heal_count > 5
    end

    def heal
      super
      @heal_count += 1
      puts "#{@name} is going berserk!" if berserk?
    end

    def hit
      if berserk?
        heal
      else
        super
      end
    end
  end
end
