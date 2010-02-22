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

class Item < ActiveRecord::Base
  include AASM
  
  belongs_to :user
  
  validates_presence_of :title, :user
  
  named_scope :recents, :order => 'created_at DESC', :limit => 10
  
  aasm_column :state
  
  aasm_initial_state :available
  
  aasm_state :available
  aasm_state :unavailable
  aasm_state :booked
  aasm_state :borrowed
  
  aasm_event :book do
    transitions :to => :booked, :from => :available
  end
  
  aasm_event :borrow do
    transitions :to => :borrowed, :from => [:booked, :available]
  end
  
end

