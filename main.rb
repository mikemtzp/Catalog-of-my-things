def options
  puts 'Choose your option from the list'
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all games'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Exit'
  puts '-----------------------------'
end

def menu
  puts 'Welcome to the catalog'
  loop do
    options
    choice = gets.chomp.to_i
    case choice
    when 1
      puts 'books'
    when 2
      puts 'music'
    when 3
      puts 'games'
    when 4
      puts 'genres'
    when 5
      puts 'labels'
    when 6
      puts 'authors'
    when 7
      puts 'Add  book'
    when 8
      puts 'Add music'
    when 9
      puts 'Add game'
    when 10
      exit
    else
      puts 'Kindly enter a valid choice'
    end
  end
end

menu
