require './item'
require 'date'

class Book < Item
  attr_accessor :title, :author, :publish_date, :publisher, :cover_state

  def initialize(title, author, publish_date, publisher, cover_state)
    super(publish_date)
    @title = title
    @author = author
    @publish_date = Date.parse(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.match?(/bad/i)
  end
end

test = Item.new('2004/04/02')
puts test.can_be_archived?
book = Book.new('Dracula', 'Bram Stoker', '2004/04/04', 'mike', 'tr')
puts book.can_be_archived?
