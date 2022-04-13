require_relative 'spec_helper'

describe Student do
  context 'when create a new student' do
    it 'return a new object' do
      student = Student.new(22)
      expect(student).to be_an_instance_of(Student)
    end

    it 'return the correct name and age' do
      student = Student.new(22, name: 'Kyrillos')
      expect(student.age).to eql(22)
      expect(student.name).to eql('Kyrillos')
    end

    it 'return number of students in the classroom' do
      student = Student.new(22, name: 'Kyrillos')
      expect(student.classroom).to be_nil
    end
  end
end
