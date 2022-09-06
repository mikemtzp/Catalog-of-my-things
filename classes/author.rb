require 'date'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def author_hash
    { id: @id, first_name: @first_name, last_name: @last_name }
  end
end
