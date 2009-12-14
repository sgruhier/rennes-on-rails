ActionController::Routing::Routes.draw do |map|
  map.resources :items
  map.root :controller => "home"
  
  map.resource  :session,
    :controller => 'sessions',
    :only       => [:new, :create, :destroy]
  
  map.sign_out 'sign_out',
    :controller => 'sessions',
    :action     => 'destroy',
    :method     => :delete
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
