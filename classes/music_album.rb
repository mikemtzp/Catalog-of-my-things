require_relative 'item'

class MusicAlbum < Item
  attr_accessor :title, :artist, :genre, :on_spotify
  attr_reader :id, :items

  def initialize(title, genre, publish_date, on_spotify: false, archived: false)
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

  private

  def can_be_archived?()
    on_spotify && (DateTime.now.year - @publish_date.year) > 10
  end
end

musicalbum = MusicAlbum.new('Kid A', 'Electronic', '2000-10-02')
puts musicalbum.title
puts musicalbum.genre
puts musicalbum.publish_date.year
puts musicalbum.on_spotify
musicalbum.on_spotify = true
puts musicalbum.on_spotify
puts musicalbum.archived
musicalbum.move_to_archive
puts musicalbum.archived
