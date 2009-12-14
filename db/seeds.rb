User.destroy_all
Item.destroy_all

admin = User.create(:email => "admin@foo.com", 
            :password => "secret", 
            :password_confirmation => "secret")
admin.confirm_email!

user = User.create(:email => "karine@foo.com", 
            :password => "secret", 
            :password_confirmation => "secret")
user.confirm_email!

1000.times do |i|
  user.items.create(:title => "bla bla bla #{i}", :description => '.....')
end
