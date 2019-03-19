require_relative '../studio_game/game'
require_relative '../studio_game/player'
require_relative '../studio_game/auditable'
module StudioGame
  class Die
  include Auditable
  attr_reader :number
    def roll
      @number = rand(1..6)
      audit
      @number
    end
  end
end
