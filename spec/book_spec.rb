require_relative '../classes/book'

describe Book do
  before(:each) do
    @book = Book.new('Dracula', '1998-03-04', 'Penguin', 'Good', 'Black')
  end

  it 'Returns @book as an instance of Book class' do
    expect(@book).to be_an_instance_of(Book)
  end

  it 'Contains title of the book' do
    expect(@book.title).to eq('Dracula')
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

  it 'Contains label of the book' do
    expect(@book.label).to eq('Black')
  end
end

describe 'Book methods' do
  it 'can_be_archived should return true when publish date is greater than 10 years' do
    book = Book.new('Dracula', '1998-03-04', 'Penguin', 'Good', 'Black')
    expect(book.send(:can_be_archived?)).to eq(true)
  end

  it 'can_be_archived should return true when cover state equals "bad"' do
    book = Book.new('Dracula', '2018-03-04', 'Penguin', 'bad', 'Black')
    expect(book.send(:can_be_archived?)).to eq(true)
  end

  it 'can_be_archived should return true when cover state equals "bad" and publish date is greater than 10 years' do
    book = Book.new('Dracula', '1998-03-04', 'Penguin', 'bad', 'Black')
    expect(book.send(:can_be_archived?)).to eq(true)
  end

  it 'can_be_archived should return false when cover state doesn\'t equal "bad"
  and publish date isnt\' greater than 10 years' do
    book = Book.new('Dracula', '2018-03-04', 'Penguin', 'Good', 'Black')
    expect(book.send(:can_be_archived?)).to eq(false)
  end
end
