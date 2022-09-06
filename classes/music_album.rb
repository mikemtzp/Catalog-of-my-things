require_relative 'item'

class MusicAlbum < Item
  def initialize(title, genre, publish_date, on_spotify: false, archived: false)
    super(publish_date)
    @title = title
    @genre = genre
    @publish_date = publish_date
    @on_spotify = on_spotify
    @archived = archived
  end

  private

  def can_be_archived?()
    on_spotify && (DateTime.now.year - @publish_date.year) > 10
  end
end
