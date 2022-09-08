require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :published_date, :game_name
  attr_reader :last_played_at

  def initialize(game_name, author, publish_date, multiplayer)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.now.year
    @author = author
    @game_name = game_name
  end

  def game_hash
    { game_name: @game_name, author: @author, publish_date: @publish_date, multiplayer: @multiplayer }
  end

  private

  def can_be_archived?
    super && (DateTime.now.year - @last_played_at) > 2
  end
end
