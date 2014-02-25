require 'spec_helper'

describe GroceryList do
  
  let(:user) { FactoryGirl.create(:user) }
  before {@groceryList = user.grocery_lists.build(name: "Test list") }

  subject { @groceryList }

  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when name is blank" do
  	before { @groceryList.name = " " }
  	it { should_not be_valid}
  end

  describe "when name is at max length" do
  	before { @groceryList.name = "a" * 50 }
  	it { should be_valid}
  end

  describe "when name is too long" do
  	before { @groceryList.name = "a" * 51 }
  	it { should_not be_valid}
  end

  describe "when user_id is not present" do
  	before { @groceryList.user_id = nil }
  	it { should_not be_valid }
  end
end
