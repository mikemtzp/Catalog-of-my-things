require_relative '../classes/author'
require_relative '../classes/item'

describe Author do
  before :each do
    @author = Author.new('Tinashe', 'Murambinda')
    @item = Item.new('2003-01-01')
  end
  describe 'Add new author' do
    it 'should return author object' do
      expect(@author).to be_an_instance_of(Author)
    end
  end

  describe 'Check instances' do
    it 'should return Tinashe' do
      expect(@author.first_name).to eq('Tinashe')
    end
    it 'should return Murambinda' do
      expect(@author.last_name).to eq('Murambinda')
    end
  end
end
