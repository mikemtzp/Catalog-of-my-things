require './classes/item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, source, silet: false)
    super(publish_date)
    @silet = silet
    @source = source
  end

  def can_be_archived?
    return true if @archived || @silet

    false
  end

  def movie_hash
    { publish_date: @publish_date, source: @source.name, silet: @silet }
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end
end

movie = Movie.new('2022-09-09', 'none')
puts movie.publish_date
