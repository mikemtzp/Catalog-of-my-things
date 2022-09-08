require_relative 'item'
require 'date'

class MusicAlbum < Item
  attr_accessor :title, :artist, :on_spotify

  def initialize(title, genre, publish_date, on_spotify, archived: false)
    super(publish_date)
    @title = title
    @genre = genre
    @publish_date = Date.parse(publish_date)
    @on_spotify = on_spotify
    @archived = archived
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def album_hash
    { title: @title, genre: @genre, publish_date: @publish_date, on_spotify: @on_spotify }
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  private

  def can_be_archived?()
    on_spotify && (DateTime.now.year - @publish_date.year) > 10
  end
end
