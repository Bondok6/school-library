require_relative 'spec_helper'

describe Classroom do 
  context "when create classroom" do 

     it "return a new object" do
      class_room = Classroom.new(1)
      expect(class_room).to be_an_instance_of(Classroom)
     end 

     it "return the label" do
      class_room = Classroom.new(1)
      expect(class_room.label).to eql(1)
      expect(class_room.students.length).to eql(0)
    end
    
  end 
end