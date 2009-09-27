User.create(:email => "admin@foo.com", :password => "secret", :password_confirmation => "secret").confirm_email!

