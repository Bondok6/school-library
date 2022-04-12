require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'


def read_books
  data = []
  books_data = JSON.parse(File.read("books.json"))
  books_data.each do |book|
    data.push(Book.new(book['title'], book['author']))
  end
 data
end

def read_people
  people = []
  people_data = JSON.parse(File.read("person.json"))
  people_data.each do |person|
    if person["specialization"]
      people.push(Teacher.new(person["age"], person["name"], person['specialization']))
    else 
      people.push(Student.new(person["age"], name: person["name"], parent_permission: person['parent_permission']))
    end
  end
 people
end