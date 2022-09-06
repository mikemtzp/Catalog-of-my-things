require './classes/item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, source, silet: false)
    super(publish_date)
    @source = source
    @silet = silet
  end

  def can_be_archived?
    return true if @archived || @silet

    false
  end

  def movie_hash
    { publish_date: @publish_date, source: @source, silet: @silet }
  end
end

movie = Movie.new('2022-09-09', nil)
puts movie.publish_date
