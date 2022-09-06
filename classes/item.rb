require 'date'

class Item
  attr_accessor :genre, :source, :author, :label, :publish_date, :archived

  def initialize(publish_date, source, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
    @source = source
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    (DateTime.now.year - @publish_date.year) > 10
  end
end
