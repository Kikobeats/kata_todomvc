require 'yaml/store'

require_relative '../models/Item'

## => Controler for Item Class
class ItemController
  @@FILENAME = 'data.yaml'

  def initialize
    @store = YAML::Store.new @@FILENAME
    @store.transaction do
      @store[:item] = []
    end
  end

  def create(title)
    item = Item.new title

    @store.transaction do
      @store[:item].push item
    end

    item
  end

  def get(id = false)
    if id
      @store.transaction do
        @store[:item][id]
      end
    else
      @store.transaction do
        @store[:item]
      end
    end
  end

  def remove(id)
    @store.transaction do
      @store[:item].delete_at id
    end
  end

  def purge
    @store.transaction do
      @store[:item].clear
    end
  end
end
