require 'spec_helper'

describe Bus do
    before(:each) do
      @valid_attributes = {
        name: "test",
        seats: 202
      }
    end
    
    it "should create a new instance given valid attributes" do
      Bus.create!(@valid_attributes)
    end

    it "should require seats" do
      bus = Bus.create(@valid_attributes.except(:seats))
      bus.should have_at_least(1).error_on(:seats)
    end

    it "should not require name" do
      bus = Bus.create(@valid_attributes.except(:name))
      bus.should have(0).error_on(:name)
    end

    it "should respond to name and seats" do
      bus = Bus.create(@valid_attributes)
      bus.should respond_to :name
      bus.should respond_to :seats
    end
    
    it "should have correct name" do
      bus = Bus.create(@valid_attributes)
      bus.name.should eq "test"
    end
    
    it "should have correct seats" do
      bus = Bus.create(@valid_attributes)
      bus.seats.should eq 202
    end

end
# 
# 
# require 'spec_helper'
# require 'question'
# 
# describe Question do
#   before(:each) do
#     QuestionCategory.create! :name => 'foo'
# 
#     @valid_attributes = {
#       :question_category_id => 1,
#       :question => "value for question",
#       :answer => "value for answer",
#       :position => 1
#     }
#   end
# 
#   it "should create a new instance given valid attributes" do
#     Question.create!(@valid_attributes)
#   end
# 
#   it "should belong to a category" do
#     question = Question.create(@valid_attributes)
#     question.question_category.should_not be_nil
#   end
# 
#   it "should require a category" do
#     question = Question.create(@valid_attributes.except(:question_category_id))
#     question.should have(1).error_on(:question_category_id)
#   end
# 
#   it "should require a question" do
#     question = Question.create(@valid_attributes.except(:question))
#     question.should have(1).error_on(:question)
#   end
# 
#   it "should require a answer" do
#     question = Question.create(@valid_attributes.except(:answer))
#     question.should have(1).error_on(:answer)
#   end
# 
#   it "should act like a list" do
#     question = Question.create(@valid_attributes)
#     Question.create(@valid_attributes)
#     
#     question.move_to_bottom
#     question.position.should eql(2)
#   end
# end
# 
