require './classes/item'

class Source
  attr_accessor :id, :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end

  def source_hash
    { name: @name }
  end
end
