require './classes/source'
require './classes/movie'

describe Source do
  before :each do
    @source = Source.new('Testing source')
    @movie = Movie.new('The Lord of the Rings', '2022-09-06', nil)
    @source.add_item(@movie)
  end

  it 'Should show the source name' do
    expect(@source.name).to eq 'Testing source'
  end

  it 'add_item method should add the item to the collection of items' do
    expect(@source.items.length).to eq 1
  end

  it 'add_item method should set the source property of movie as the source itself' do
    expect(@movie.source).to eq @source
  end
end
