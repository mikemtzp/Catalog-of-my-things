require_relative 'app'

def options
  puts 'Choose your option from the list'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List all games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a movie'
  puts '12 - Add a game'
  puts '13 - Exit'
  puts '-----------------------------'
end

def menu
  app = App.new
  puts 'Welcome to the catalog'
  loop do
    options
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'books'
    when 2
      app.list_music_albums
    when 3
      puts 'movies'
    when 4
      app.list_games
    when 5
      app.list_all_genres
    when 6
      puts 'labels'
    when 7
      app.list_authors
    when 8
      puts 'sources'
    when 9
      puts 'Add  book'
    when 10
      app.add_music_album
    when 11
      puts 'Add movie'
    when 12
      app.add_game
    when 13
      exit
    else
      puts 'Kindly enter a valid choice'
    end
  end
end

menu
