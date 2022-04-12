require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'require_inputs'
require_relative 'storage'
require_relative 'read_files'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = read_books
    @people = read_people
    @rentals = []
  end

  def list_all_books
    books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
  end

  def list_all_people
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    choice, age, name = grap_person_data
    case choice
    when 1
      permission = grap_permission
      people.push(Student.new(age, name: name, parent_permission: permission))
    when 2
      specialization = grap_specialization
      people.push(Teacher.new(specialization, age, name))
    end
    puts 'Person created successfully.'
    save_people(people)
  end

  def create_book
    title, author = grap_book_data
    books.push(Book.new(title, author))
    puts 'Book created successfully.'
    save_books(books)
  end

  def create_rental
    list_all_books
    book_input = grap_book_input

    list_all_people
    person_input = grap_person_input

    date = grap_date

    rentals.push(Rental.new(date, people[person_input], books[book_input]))
    puts 'Rental created successfully.'
    save_rentals(rentals)
  end

  def list_all_rentals_by_id
    person_id = grap_person_id
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}" if rental.person.id == person_id
    end
  end
end
