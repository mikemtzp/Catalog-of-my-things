module BooksModule
  def list_books
    puts "\nAll Books:\n"
    puts "___________________________________________\n\n"
    if @all_books.length.zero?
      puts 'No books available'
    else
      @all_books.map do |book|
        puts "Title: #{book[:title]}, Author: #{book[:author]}, Publisher: #{book[:publisher]}, Publish date: #{book[:publish_date]}"
      end
    end
    puts "___________________________________________\n\n"
  end

  def list_labels
    puts "\nAll Labels:\n"
    puts "___________________________________________\n\n"
    if @all_labels.length.zero?
      puts 'No labels available'
    else
      @all_labels.map do |label|
        puts "Label ID: #{label[:id]}, Title: #{label[:title]}, Color: #{label[:color]}"
      end
    end
    puts "___________________________________________\n\n"
  end

  def add_book
    puts 'Enter book information'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Date of publication [yyyy-mm-dd]: '
    published_date = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state [good - regular - bad]: '
    cover_state = gets.chomp
    puts 'Enter label information'
    print 'Title: '
    label_title = gets.chomp
    print 'Color: '
    color = gets.chomp
    new_book = Book.new(title, author, published_date, publisher, cover_state).book_hash
    new_label = Label.new(label_title, color).label_hash
    @all_books << (new_book)
    @all_labels << (new_label)
    books_data = JSON.pretty_generate(@all_books.map(&:to_hash))
    labels_data = JSON.pretty_generate(@all_labels.map(&:to_hash))
    store('books', books_data)
    store('labels', labels_data)
    puts 'Books and Label added successfully!'
  end
end
