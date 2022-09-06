require 'json'
require 'fileutils'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/books_module'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/games_module'

class App
  include BookModule
  include GamesModule

  attr_reader :all_books, :all_labels, :all_authors, :all_games

  def initialize
    @all_books = load_data('books')
    @all_labels = load_data('labels')
    @all_games = load_data('games')
    @all_authors = load_data('authors')
  end

  def store(file, obj)
    File.write("./data/#{file}.json", obj)
  end

  def load_data(file)
    file_name = "./data/#{file}.json"
    FileUtils.touch(file_name) unless File.exist?(file_name)
    data = File.read(file_name)
    return [] if data == ''

    JSON.parse(data, symbolize_names: true)
  end
end
