require_relative '../classes/music_album'

describe MusicAlbum do
  context 'Creating music album' do
    before(:each) do
      @new_album = MusicAlbum.new('Kalk samen kuri no hana', 'Progressive pop', '2003-02-23', true)
    end
    it 'Should create a new album' do
      expect(@new_album).to be_an_instance_of(MusicAlbum)
    end
    it 'Should return the correct name' do
      expect(@new_album.title).to eq('Kalk samen kuri no hana')
      expect(@new_album.title == 'Kalk samen kuri no hana').to be_truthy
      expect(@new_album.title == 'Shoso Strip').to be_falsey
    end
    it 'Should return the correct genre' do
      expect(@new_album.genre).to eq('Progressive pop')
      expect(@new_album.genre == 'Progressive pop').to be_truthy
      expect(@new_album.genre == 'Math metal').to be_falsey
    end
    it 'Should return the correct release date' do
      expect(@new_album.publish_date.year).to eq(2003)
      expect(@new_album.publish_date.year == 2003).to be_truthy
      expect(@new_album.publish_date.year == 2002).to be_falsey
    end
    it 'Should return archived as false' do
      expect(@new_album.archived).to be_falsey
    end
    it 'Should return on_spotify as true' do
      expect(@new_album.on_spotify).to be_truthy
    end
  end
end
