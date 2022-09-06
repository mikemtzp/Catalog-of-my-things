require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :published_date
  attr_reader :last_played_at

  def initialize(author, publish_date, multiplayer)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = DateTime.now.year
    @author = author
  end

  def game_hash
    { author: @author, publish_date: @publish_date, multiplayer: @multiplayer }
  end

  private

  def can_be_archived?
    super && (DateTime.now.year - @last_played_at) > 2
  end
end
