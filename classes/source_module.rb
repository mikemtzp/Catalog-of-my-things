module SourceModule
  def show_sources
    puts "\nAll the Sources:\n"
    puts "___________________________________________\n\n"
    if @all_sources.empty?
      puts "No sources avaliable\n"
      puts "___________________________________________\n\n"
    else
      @all_sources.map do |source|
        puts "ID: #{source[:id]} - Name: #{source[:name]} - Items: #{source[:items].length}\n"
        puts "___________________________________________\n\n"
      end
    end
  end
end
