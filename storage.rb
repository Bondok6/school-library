require 'json'
require_relative 'app'

def save_books(books)
  data = []
  books.each do |book|
    data.push({title: book.title, author: book.author})
  end
  File.write('books.json',JSON.generate(data))
end