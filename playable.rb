module Playable
  def hit
    self.health -= 10
    puts "\t#{name} got hit!"
  end

  def heal
    self.health += 15
    puts "\t#{name} has been healed!"
  end

  def strong?
    self.health > 100
  end
end
