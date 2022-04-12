require_relative 'decorator'
require_relative 'rental'

class Person < Nameable
  # getter & setter
  attr_accessor :name, :age, :rentals, :parent_permission
  # getter
  attr_reader :id

  # initialization(constructor)
  def initialize(age, name: 'Unknown', parent_permission: true, id:nil)
    super()
    @id = id || Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  # return true if @age >= 18
  def of_age?
    @age >= 18
  end

  # return true if is_of_age or @parent_permission equal true.
  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private :of_age?
  public :can_use_services?
end
