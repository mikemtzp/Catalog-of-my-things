require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('Dracula', 'Bram Stoker', '1998-03-04', 'Penguin', 'Good')
  end

  it 'Returns @book as an instance of Book class' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Contains title of the book' do
    expect(@book.title).to eq('Dracula')
  end

  it 'Contains author of the book' do
    expect(@book.author).to eq('Bram Stoker')
  end

  it 'Contains published date of the book' do
    expect(@book.publish_date).to eq(Date.parse('1998-03-04'))
  end

  it 'Contains publisher of the book' do
    expect(@book.publisher).to eq('Penguin')
  end

  it 'Contains cover state of the book' do
    expect(@book.cover_state).to eq('Good')
  end
end
