require 'json'
require_relative 'app'
require_relative 'teacher'
require_relative 'student'
require_relative 'person'

def save_books(books)
  data = []
  books.each do |book|
    data.push({title: book.title, author: book.author})
  end
  File.write('books.json',JSON.generate(data))
end

def save_people(people)
  people_data = []
  people.each do |person|
    if person.instance_of?(Teacher)
      people_data.push({age: person.age, name: person.name, specialization: person.specialization})
    elsif person.instance_of?(Student)
      people_data.push({age: person.age, name: person.name, parent_permission: person.parent_permission})
    end
  end
  File.write('person.json',JSON.generate(people_data))
end