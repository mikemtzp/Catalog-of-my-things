require_relative '../classes/genre'

describe Genre do
  context 'Creating genre' do
    before(:each) do
      @new_genre = Genre.new('Hypnagogic pop', '2000-10-01')
    end
    it 'Should create a new genre' do
      expect(@new_genre).to be_an_instance_of(Genre)
    end
    it 'Should return the correct name' do
      expect(@new_genre.name).to eq('Hypnagogic pop')
      expect(@new_genre.name == 'Hypnagogic pop').to be_truthy
      expect(@new_genre.name == 'Classic rock').to be_falsey
    end
    it 'Should return the correct release date' do
      expect(@new_genre.publish_date.year).to eq(2000)
      expect(@new_genre.publish_date.year == 2000).to be_truthy
      expect(@new_genre.publish_date.year == 1999).to be_falsey
    end
  end
end
