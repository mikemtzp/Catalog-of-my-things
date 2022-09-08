module BooksModule
  def list_books
    puts "\nAll Books:\n"
    puts "___________________________________________\n\n"
    if @all_books.empty?
      puts 'No books available'
    else
      @all_books.map do |book|
        puts "Title: #{book[:title]} - Author: #{book[:author]} - Publisher: #{book[:publisher]} - Publish date: #{book[:publish_date]} - Label: #{book[:label]}"
      end
    end
    puts "___________________________________________\n\n"
  end

  def list_labels
    puts "\nAll Labels:\n"
    puts "___________________________________________\n\n"
    if @all_labels.empty?
      puts 'No labels available'
    else
      @all_labels.map do |label|
        puts "Label ID: #{label[:id]} - Title: #{label[:title]} - Color: #{label[:color]} - Items: #{label[:items].length}\n"
      end
    end
    puts "___________________________________________\n\n"
  end

  def add_book
    puts 'Enter book information'
    print 'Title: '
    title = gets.chomp
    print 'Date of publication [yyyy-mm-dd]: '
    published_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp.capitalize
    print 'Cover state [good - regular - bad]: '
    cover_state = gets.chomp.capitalize
    puts 'Enter label information'
    print 'Title: '
    label_title = gets.chomp
    print 'Color: '
    color = gets.chomp.capitalize
    book = Book.new(title, published_date, publisher, cover_state, nil)
    label = Label.new(label_title, color)
    label.add_item(book)
    @all_books << (book.book_hash)
    @all_labels << (label.label_hash)
    books_data = JSON.pretty_generate(@all_books.map(&:to_hash))
    labels_data = JSON.pretty_generate(@all_labels.map(&:to_hash))
    store('books', books_data)
    store('labels', labels_data)
    puts "\nBook and Label created successfully!\n\n"
  end
end
