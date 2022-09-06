require_relative 'item'

class Genre < Item
  attr_accessor :name, :publish_date
  attr_reader :id, :items

  def initialize(name, publish_date, archived: false)
    super(publish_date)
    @name = name
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @items = []
  end

  def genre_hash
    { name: @name, publish_date: @publish_date }
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
