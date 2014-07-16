require_relative '../controllers/ItemController'

describe 'TODO Item spec' do
  before :each do
    @item_controller = ItemController.new
    @item_controller.purge
    @item_controller.create('walk the dog')
    @item_controller.create('walk the turtle')
  end

  it 'should create an item with a name' do
    expect(@item_controller.get(0).name).to eq('walk the dog')
    expect(@item_controller.get(1).name).to eq('walk the turtle')
  end

  it 'should delete an item' do
    @item_controller.remove(1)
    expect(@item_controller.get.length).to eq(1)
    # expect(@item_controller.get(1)).to eq('400, item not found')
  end
end
