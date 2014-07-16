class ItemController
  def initialize(dao)
    @dao = dao
  end

  def create(title)
    item = Item.new title
    @dao.save item
    item.json
  end

  def get(id = false)
    @dao.get(id)
  end

  def remove(id)
    @dao.delete(id)
  end
end
