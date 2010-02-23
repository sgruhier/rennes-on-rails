Factory.sequence :title do |n|
  "title#{n}"
end

Factory.define :item do |i|
  i.title { Factory.next(:title) }
  i.description 'bla bla'
end

# TODO: verifier
# Factory.define(:item_with_user, :parent => :item) do |item|
#   item.user Factory(:email_confirmed_user)
# end
# 
