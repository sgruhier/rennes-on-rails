class HomeController < ApplicationController
  def index
    @recents = Item.recents
  end

end
