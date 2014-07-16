require 'yaml/store'
require 'json'
require 'pry'

require_relative 'helpers/builder'
require_relative '../models/item'

## => Convertion of types
class ItemDAO
  FILENAME = 'data.yaml'

  def initialize
    @store = YAML::Store.new FILENAME
    @store.transaction do
      @store[:item] = []
    end
  end

  def save(item)

    format = item.json

    @store.transaction do
      @store[:item].push format
    end
  end

  def get(id)
    if id
      @store.transaction do
        JSON.parse @store[:item][id]
      end
    else
      @store.transaction do
        @store[:item].reduce([]) do |sum, element|
          sum.push(JSON.parse(element))
        end
      end
    end
  end

  def delete(id)
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
