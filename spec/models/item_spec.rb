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
  
  it "should be booked an available item" do
    item = Factory.create(:item, :user => Factory(:email_confirmed_user))
    item.book
    item.should be_booked
  end
  
  %w(booked borrowed unavailable).each do |state| 
    it "should not be bookable if #{state}" do
      lambda {
        item = Factory.create(:item, :user => Factory(:email_confirmed_user), :state => state)
        item.book
      }.should raise_error(AASM::InvalidTransition)
    end
  end
  
  
  All_states = %w(booked borrowed unavailable available) 
  Borrowable_states = %w(booked available)

  All_states.each do |state| 
     item = Factory.create(:item, :user => Factory(:email_confirmed_user), :state => state)
     if Borrowable_states.include?(state)
       it "should be borrowable if #{state}" do
         item.borrow
         item.should be_borrowed
       end
     else
       it "should not be borrowable if #{state}" do
         lambda {
           item.borrow
         }.should raise_error(AASM::InvalidTransition)
       end 
     end
   end
end

