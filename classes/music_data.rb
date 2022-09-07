require_relative 'music_album'
require_relative 'genre'

module MusicData
  def list_music_albums
    puts 'Music albums: '
    if @all_albums.length.zero?
      puts 'No music albums available'
    else
      @all_albums.each do |album|
        puts "Title: #{album[:title]}, Genre: #{album[:genre]}, Publish date: #{album[:publish_date]}, On Spotify?: #{album[:on_spotify]}\n"
      end
    end
  end

  def list_all_genres
    puts 'Music genres: '
    if @all_genres.length.zero?
      puts 'No music genres available'
    else
      @all_genres.each do |genre|
        puts "Name: #{genre[:name]}, Publish date: #{genre[:publish_date]}\n"
      end
    end
  end

  def add_music_album
    puts 'Album title: '
    title = gets.chomp
    puts 'Genre: '
    genre = gets.chomp
    puts 'Publish date: '
    publish_date = gets.chomp
    puts 'Is this album on Spotify? [Y/N]: '
    on_spotify = gets.chomp.capitalize == 'Y'
    new_album = MusicAlbum.new(title, genre, publish_date, on_spotify).album_hash
    @all_albums.push(new_album)
    new_genre = Genre.new(genre, publish_date).genre_hash
    @all_genres.push(new_genre)
    album_data = JSON.pretty_generate(@all_albums.map(&:to_hash))
    genre_data = JSON.pretty_generate(@all_genres.map(&:to_hash))
    store('albums', album_data)
    store('genres', genre_data)
    puts 'Album and genre added successfully!'
  end
end
