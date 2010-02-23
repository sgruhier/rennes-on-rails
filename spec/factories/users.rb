Factory.define(:user_with_items, :parent => :email_confirmed_user) do |user|
  user.after_create do |u|
    2.times {Factory.create(:item, :user => u)}
  end
end
