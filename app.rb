require 'json'
require 'fileutils'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/books_module'
require_relative './classes/game'
require_relative './classes/author'
require_relative './classes/games_module'
require_relative './classes/movie'
require_relative './classes/source'
require_relative './classes/movies_module'
require_relative './classes/source_module'
require_relative './classes/music_data'

class App
  include BooksModule
  include GamesModule
  include MoviesModule
  include MusicData
  include SourceModule

  attr_reader :all_authors, :all_games, :all_albums, :all_genres, :all_books, :all_labels

  def initialize
    @all_books = load_data('books')
    @all_labels = load_data('labels')
    @all_games = load_data('games')
    @all_authors = load_data('authors')
    @all_movies = load_data('movies')
    @all_sources = load_data('sources')
    @all_albums = load_data('albums')
    @all_genres = load_data('genres')
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
