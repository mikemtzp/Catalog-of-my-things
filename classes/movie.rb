require './classes/item'

class Movie < Item
  attr_accessor :silet, :title

  def initialize(title, publish_date, source, silet: false)
    super(publish_date)
    @title = title
    @silet = silet
    @source = source
  end

  def movie_hash
    { title: @title, publish_date: @publish_date, source: @source.name, silet: @silet }
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  private

  def can_be_archived?
    return true if @archived || @silet

    false
  end
end
