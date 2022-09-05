class Item
  attr_accessor :genre, :source, :author, :label

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    true if @publish_date > '2012/09/05'
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end
end
