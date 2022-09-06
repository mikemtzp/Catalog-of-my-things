require 'json'
require 'fileutils'
require_relative './game'
require_relative './author'

class App
  attr_reader :all_authors, :all_games

  def initialize
    @all_games = load_data('games')
    @all_authors = load_data('authors')
  end

  def list_games
    puts "\nAll Games:\n"
    puts "___________________________________________\n\n"
    if @all_games.length.zero?
      puts 'No games available'
    else
      @all_games.map do |game|
        puts "Publication Date: #{game[:publish_date]}, Multiplayer: #{game[:multiplayer]}"
      end
    end
    puts "___________________________________________\n\n"
  end

  def list_authors
    puts "\nAll Authors:\n"
    puts "___________________________________________\n\n"
    if @all_authors.length.zero?
      puts 'No authors available'
    else
      @all_authors.map do |author|
        puts "Author ID: #{author[:id]}, First Name: #{author[:first_name]}, Last Name: #{author[:last_name]}"
      end
    end
    puts "___________________________________________\n\n"
  end

  def add_game
    puts 'Enter game information'
    print 'Date of publication [yyyy-mm-dd]: '
    publish_date = gets.chomp
    print 'Has multiplayer? [Y/N]:'
    multiplayer = gets.chomp
    puts 'Enter author information'
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    new_author = Author.new(first_name, last_name).author_hash
    new_game = Game.new(first_name, publish_date, multiplayer).game_hash
    @all_games.push(new_game)
    @all_authors.push(new_author)
    games_data = JSON.pretty_generate(@all_games.map(&:to_hash))
    authors_data = JSON.pretty_generate(@all_authors.map(&:to_hash))
    store('games', games_data)
    store('authors', authors_data)
    puts 'Game and author added successfully!'
  end

  def store(file, obj)
    File.write("./#{file}.json", obj)
  end

  def load_data(file)
    file_name = "#{file}.json"
    FileUtils.touch(file_name.to_s) unless File.exist?(file_name)
    data = File.read(file_name)
    return [] if data == ''

    JSON.parse(data, symbolize_names: true)
  end
end
