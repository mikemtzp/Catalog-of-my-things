require_relative '../classes/label'
require_relative '../classes/book'

describe Label do
  before(:each) do
    @label = Label.new('Vampire', 'Black')
  end

  it 'Returns @label as an instance of Label class' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'Contains title of the label' do
    expect(@label.title).to eq('Vampire')
  end

  it 'Contains color of the label' do
    expect(@label.color).to eq('Black')
  end
end

describe 'Label methods' do
  before(:each) do
    @label = Label.new('Vampire', 'Black')
    @book = Book.new('Dracula', 'Bram Stoker', '1998-03-04', 'Penguin', 'Good')
    @label.add_item(@book)
  end

  it 'add_item method should add the item to the collection of items' do
    expect(@label.items.length).to eq 1
  end

  it 'add_item method should set the label property of book as the label itself' do
    expect(@book.label).to eq @label
  end
end
