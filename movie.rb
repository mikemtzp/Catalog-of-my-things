require './item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, source, silet: false, archived: false)
    super(publish_date, source, archived: archived)
    @silet = silet
  end

  def can_be_archived?
    return true if @archived || @silet

    false
  end
end
