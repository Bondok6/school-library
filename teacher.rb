require_relative 'person'

class Teacher < Person
  attr_accessor :specialization
  attr_reader :id

  def initialize(specialization, age, name, id:nil)
    super(age, name: name, id: id)
    @id = id || Random.rand(1..1000)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
