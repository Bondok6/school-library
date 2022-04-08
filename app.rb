require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def list_all_books(books)
  books.each { |book| puts "Title '#{book.title}', Author #{book.author}" }
end

def list_all_people(people)
  people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
end

def create_person(people)
  print 'Do you want to create a student (1) or a teacher (2): '
  choice = gets.chomp.to_i
  print 'Age: '
  age = gets.chomp.to_i
  print 'Name: '
  name = gets.chomp
  case choice
  when 1
    print 'Has parent permission? [Y/N]: '
    permission_input = gets.chomp
    permission = true if permission_input == 'Y'
    permission = false if permission_input == 'N'
    people.push(Student.new(age, name: name, parent_permission: permission))
  when 2
    print 'Specialization: '
    specialization = gets.chomp
    people.push(Teacher.new(specialization, age, name))
  end
  puts 'Person created successfully.'
end

def create_book(books)
  print 'Title: '
  title = gets.chomp
  print 'Author: '
  author = gets.chomp
  books.push(Book.new(title, author))
  puts 'Book created successfully.'
end

def create_rental(books, people, rentals)
  puts 'Select a book from the following list by number'
  books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  book_input = gets.chomp.to_i

  puts 'Select a person from the following list by number (Not ID): '
  people.each_with_index { |person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  person_input = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp

  rentals.push(Rental.new(date, people[person_input], books[book_input]))
  puts 'Rental created successfully.'
end

def list_all_rentals_by_id(rentals)
  print 'ID of person: '
  person_id = gets.chomp.to_i
  rentals.each do |rental|
    puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
  end
end

def display_list
  puts 'Welcome to School library App!'
  puts "
    Please choose an option by entering a number:
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit"
end

def options(books, people, rentals)
  loop do
    display_list
    option = gets.chomp.to_i
    case option
    when 1
      list_all_books(books)
    when 2
      list_all_people(people)
    when 3
      create_person(people)
    when 4
      create_book(books)
    when 5
      create_rental(books, people, rentals)
    when 6
      list_all_rentals_by_id(rentals)
    else
      break
    end
  end
end
