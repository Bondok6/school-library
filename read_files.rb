require 'json'
require_relative 'book'

def read_books
  data = []
  books_data = JSON.parse(File.read("books.json"))
  books_data.each do |book|
    data.push(Book.new(book['title'], book['author']))
  end
 data
end
