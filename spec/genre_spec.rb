require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  context 'Creating genre' do
    before(:each) do
      @new_genre = Genre.new('Hypnagogic pop', '2000-10-01')
      @new_album = MusicAlbum.new('Love Letters From Hell', 'Hypnagogic pop', '2000-10-01', false)
      @new_genre.add_item(@new_album)
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
    it 'Should add the album to the items list' do
      expect(@new_genre.items.length).to be(1)
    end
    it 'Should set the albums genre as itself' do
      expect(@new_album.genre).to be(@new_genre)
    end
  end
end
