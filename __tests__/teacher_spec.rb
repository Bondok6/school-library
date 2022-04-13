require_relative 'spec_helper'

describe Teacher do
  context 'when create a new teacher' do
    it 'return a new object' do
      teacher = Teacher.new('Math', 40, 'John')
      expect(teacher).to be_an_instance_of(Teacher)
    end

    it 'return the correct specialization, name and age' do
      teacher = Teacher.new('Math', 40, 'John')
      expect(teacher.specialization).to eql('Math')
      expect(teacher.age).to eql(40)
      expect(teacher.name).to eql('John')
    end

    it 'return true if age is greater than 18 is true' do
      teacher = Teacher.new('Math', 40, 'John')
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
