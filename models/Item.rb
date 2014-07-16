require 'json'

## => Item Class
class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def json
    { 'name' => @name }.to_json
  end

end
