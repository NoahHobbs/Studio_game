require_relative 'game'
require_relative 'player'

class Die
attr_reader :number

  
  def roll
    @number = rand(1..6)
  end
end
