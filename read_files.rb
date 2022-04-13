require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

def read_books
  data = []
  if File.exist?('books.json')
    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book|
      data.push(Book.new(book['title'], book['author'], id: book['id']))
    end
  end
  data
end

def read_people
  people = []
  if File.exist?('person.json')
    people_data = JSON.parse(File.read('person.json'))
    people_data.each do |person|
      if person['specialization']
        people.push(Teacher.new(person['age'], person['name'], person['specialization'], id: person['id']))
      else
        people.push(Student.new(person['age'], name: person['name'], parent_permission: person['parent_permission'],
                                               id: person['id']))
      end
    end
  end
  people
end

def read_rentals(books, people)
  rentals = []
  if File.exist?('rentals.json')
    rentals_data = JSON.parse(File.read('rentals.json'))
    rentals_data.each do |rental|
      person = people.select { |item| item.id == rental['person_id'] }
      book = books.select { |item| item.id == rental['book_id'] }
      rentals.push(Rental.new(rental['date'], person[0], book[0]))
    end
  end
  rentals
end
