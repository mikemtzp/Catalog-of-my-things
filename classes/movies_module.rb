module MoviesModule
  def add_movie
    puts "\n.Enter Movie information\n\n"
    puts "Date of Publication [yyyy-mm-dd]:\n\n"
    publish_date = gets.chomp
    puts "\n.Is a silent movie? [Y/N]\n\n"
    silet = gets.chomp
    puts "\n.Source?\n\n"
    source_name = gets.chomp
    source = Source.new(source_name)
    case silet == 'Y'
    when true
      movie = Movie.new(publish_date, nil, silet: true)
    when false
      movie = Movie.new(publish_date, nil)
    end
    source.add_item(movie)
    @all_movies.push(movie.movie_hash)
    @all_sources.push(source.source_hash)
    movies_data = JSON.pretty_generate(@all_movies.map(&:to_hash))
    sources_data = JSON.pretty_generate(@all_sources.map(&:to_hash))
    store('movies', movies_data)
    store('sources', sources_data)
    puts "\nMOVIE CREATED SUCCESSFULLY!\n\n"
  end

  def show_movies
    puts "\nAll the Movies:\n"
    puts "___________________________________________\n\n"
    if @all_movies.empty?
      puts "No movies avaliable\n"
      puts "___________________________________________\n\n"
    else
      @all_movies.map do |movie|
        puts "Publication date: #{movie[:publish_date]} - Silent: #{movie[:silet]} - Source: #{movie[:source]}"
      end
    end
  end
end
