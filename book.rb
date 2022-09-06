require './item'

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

  def public_can_be_archived?
    can_be_archived?
  end

  private

  def can_be_archived?
    super || @cover_state.match?(/bad/i)
  end
end
