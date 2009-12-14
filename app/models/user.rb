# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  email              :string(255)
#  encrypted_password :string(128)
#  salt               :string(128)
#  token              :string(128)
#  token_expires_at   :datetime
#  email_confirmed    :boolean         default(FALSE), not null
#  confirmation_token :string(128)
#  remember_token     :string(128)
#

class User < ActiveRecord::Base
  include Clearance::User
  has_many :items
end

