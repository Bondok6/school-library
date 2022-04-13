require_relative 'spec_helper'

describe Book do
  context 'when create a new book' do
    it 'return a new object' do
      book = Book.new('Learn Ruby', 'Dr.John')
      expect(book).to be_an_instance_of(Book)
    end
    it 'return the correct title and author' do
      book = Book.new('Learn Ruby', 'Dr.John')
      expect(book.title).to eql('Learn Ruby')
      expect(book.author).to eql('Dr.John')
    end
  end
end
