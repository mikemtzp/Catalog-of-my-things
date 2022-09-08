require_relative 'item'

class Book < Item
  attr_accessor :title, :author, :publish_date, :publisher, :cover_state

  def initialize(title, publish_date, publisher, cover_state, label)
    super(publish_date)
    @title = title
    @publish_date = Date.parse(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
  end

  def public_can_be_archived?
    can_be_archived?
  end

  def book_hash
    { title: @title, publish_date: @publish_date, publisher: @publisher, cover_state: @cover_state, label: @label.title }
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    super || @cover_state.match?(/bad/i)
  end
end
