require "spec_helper"

  attr = {:name => 'Sample List for testing', :description =>"Creating a sample list for the purpose of testing"}

describe List do
  it "can be created" do
    lambda {
      sample_list = List.new(attr)
      sample_list.save
    }.should change(List, :count).by(1)
  end

  it "should not be valid without a name" do
     sample_list = List.new(attr)
     sample_list.should_not be_valid
     sample_list.errors[:name].should_not be_empty

  end
end