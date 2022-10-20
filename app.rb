require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/boardcase'

def perform
  current_game = Game.new
  current_game.play
  while current_game.play_again?
    current_game.play
  end
  current_game.results
end

perform