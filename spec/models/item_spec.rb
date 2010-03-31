# == Schema Information
#
# Table name: items
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Item do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :description => "value for description",
      :user => Factory(:email_confirmed_user)
    }
    User.destroy_all
  end

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }
  it { should belong_to(:user) }

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
  
  it "should be as available when created" do
    item = Factory.create(:item, :user => Factory(:email_confirmed_user))
    item.should be_available
  end
  
  describe "State machine" do
    before(:each) do
      @user = Factory(:email_confirmed_user)
    end

    {
      :borrow => [:booked, :available],
      :book   => [:available]
    }.each do |to_state, valid_from_states|
    Item.aasm_states.map(&:name).each do |state| 
        if valid_from_states.include?(state)
          it "should be #{to_state}able if #{state}" do
            item = Factory.create(:item, :user => @user, :state => state)
            item.send to_state
            item.send("#{to_state}ed?").should be_true
          end
        else
          it "should not be #{to_state}able if #{state}" do
            item = Factory.create(:item, :user => @user, :state => state)
            lambda {
              item.send to_state
            }.should raise_error(AASM::InvalidTransition)
          end 
        end
      end
    end
  end
end

