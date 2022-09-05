require './item'

class Movie < Item
  attr_accessor :silet

  def initialize(silet: false)
    super(publish_date, archived)
    @silet = silet
  end
end
