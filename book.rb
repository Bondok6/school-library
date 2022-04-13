require_relative 'rental'

class Book
  attr_accessor :title, :author, :rentals
  attr_reader :id

  def initialize(title, author, id: nil)
    @id = id || Random.rand(1..1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end
end
