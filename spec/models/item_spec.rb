require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Item do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :user => Factory(:email_confirmed_user)
    }
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
end
