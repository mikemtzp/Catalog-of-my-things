require_relative 'item'

class Genre < Item
  def initialize(name)
    super(id, publish_date, archived)
    @name = name
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.genre = self
  end
end
