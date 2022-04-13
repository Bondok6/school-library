require_relative 'spec_helper'

describe Person do
  context 'when create a new person' do
    it 'return a new object' do
      person = Person.new(24)
      expect(person).to be_an_instance_of(Person)
    end

    it 'return the correct name and age' do
      person = Person.new(24, name: 'Jeff')
      expect(person.age).to eql(24)
      expect(person.name).to eql('Jeff')
    end

    it 'return true if age is greater or equal to 18' do
      person = Person.new(24)
      expect(person.of_age?).to be(true)
    end

    it 'return true if age is true or parent permission is true' do
      person = Person.new(24)
      expect(person.can_use_services?).to be(true)
    end

    it 'return true if age is true or parent permission is true' do
      person = Person.new(24, name: 'Jeff')
      expect(person.correct_name).to eql('Jeff')
    end
  end
end
