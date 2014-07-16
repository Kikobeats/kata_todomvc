class Builder

  def self.json(object)

    { 'name' => @name }.to_json

  end

end
