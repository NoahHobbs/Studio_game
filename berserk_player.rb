require_relative 'player'

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




 if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.heal }
  2.times { berserker.hit }
  puts berserker.health
end
