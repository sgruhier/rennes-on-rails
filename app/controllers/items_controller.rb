class ItemsController < ApplicationController
  before_filter :authenticate , :only => [:new, :create]
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = current_user.items.build params[:item]
    if @item.save
      flash[:success] = "Item successfully created."
      redirect_to items_path
    else
      render :new
    end
  end
end
