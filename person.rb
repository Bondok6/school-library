class Person
  # getter & setter
  attr_accessor :name, :age
  # getter
  attr_reader :id

  # initialization(constructor)
  def initialize(age, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # return true if @age >= 18
  def of_age?
    @age >= 18
  end

  # return true if is_of_age or @parent_permission equal true.
  def can_use_services?
    is_of_age? || @parent_permission
  end

  private :of_age?
  public :can_use_services?
end
