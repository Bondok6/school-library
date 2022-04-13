require_relative 'spec_helper'

describe Rental do
  context 'when create a rental' do
    it 'return a new object' do
      person = Person.new(24, name: 'Jeff')
      book = Book.new('Learn Ruby', 'Dr.John')
      date = '25/10/2005'
      rental = Rental.new(date, person, book)
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'return the correct date' do
      person = Person.new(24, name: 'Jeff')
      book = Book.new('Learn Ruby', 'Dr.John')
      date = '25/10/2005'
      rental = Rental.new(date, person, book)
      expect(rental.date).to eql('25/10/2005')
      expect(rental.date).to be(date)
    end
  end
end
