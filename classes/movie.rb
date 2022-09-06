require './classes/item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, source, silet: false, archived: false)
    super(publish_date, archived: archived)
    @silet = silet
    @source = source
  end

  def can_be_archived?
    return true if @archived || @silet

    false
  end
end

movie = Movie.new('2022-09-09', 'none')
puts movie.publish_date
