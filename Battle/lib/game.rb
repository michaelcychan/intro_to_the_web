# lib/game.rb

class Game

  attr_accessor :whose_turn, :another_player

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @whose_turn = @players[0]
    @another_player = @players[1]
  end

  def player_1
    @players[0]
  end

  def player_2
    @players[1]
  end

  # refactored to another class
  # def attack(player)
  #   player.receive_damage
  # end

  def switch_turn
    @another_player = @whose_turn
    @whose_turn = next_turn_of(whose_turn)
  end

  private

  def next_turn_of(now)
    nextone = @players.find_index(now) + 1
    nextone = 0 if nextone == @players.length
    return @players[nextone]
  end
end