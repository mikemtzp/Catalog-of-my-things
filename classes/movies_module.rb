module MoviesModule
  def add_movie
    puts 'Enter Movie information'
    puts 'Date of Publication [yyyy-mm-dd]:'
    publish_date = gets.chomp
    puts 'is a silent movie? [Y/N]'
    silet = gets.chomp
    puts 'source?'
    source_name = gets.chomp
    source = Source.new(source_name)
    case silet == 'Y'
    when true
      movie = Movie.new(publish_date, nil, silet: true).movie_hash
    when false
      movie = Movie.new(publish_date, nil).movie_hash
    end
    source.add_item(movie)
    source = source.source_hash
    @all_movies.push(movie)
    @all_sources.push(source)
    movies_data = JSON.pretty_generate(@all_movies.map(&:to_hash))
    sources_data = JSON.pretty_generate(@all_sources.map(&:to_hash))
    store('movies', movies_data)
    store('sources', sources_data)
    puts 'Movie craated successfully!'
  end

  def show_movies
    puts "\nAll the Movies:\n"
    puts "___________________________________________\n\n"
    if @all_movies.empty?
      puts 'No movies avaliable'
    else
      @all_movies.map do |movie|
        puts "Publication date: #{movie[:publish_date]} - Silent: #{movie[:silet]} - Source: #{movie[:source]}"
      end
    end
  end
end
