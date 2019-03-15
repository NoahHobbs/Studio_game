require_relative 'player'

class ClumsyPlayer < Player
  attr_reader :boost_factor
  def initialize(name, health=100, boost_factor=1)
    super(name, health)
    @boost_factor = boost_factor
  end

  def found_treasure(treasure)
    damaged_treasure = Treasure.new(treasure.name, treasure.points / 2.0)
    super(damaged_treasure)
  end

  def heal
    @boost_factor.times { super }
  end
end
  clumsy = ClumsyPlayer.new("Klutz", 105, 3)
