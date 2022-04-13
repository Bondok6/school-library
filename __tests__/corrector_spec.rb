require_relative 'spec_helper'

describe Corrector do
  context 'when create corrector object' do
    it 'return a new object' do
      person = Corrector.new
      expect(person).to be_an_instance_of(Corrector)
    end

    it 'return the correct name' do
      person = Corrector.new
      expect(person.correct_name('bondok')).to eql('Bondok')
    end
  end
end
