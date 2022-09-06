require_relative 'item'

class Genre < Item
  def initialize(_name)
    super(id, publish_date, archived)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @items = []
  end

  def add_item(_item)
    @items.push
    items.genre = self
  end
end
