class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new params[:item]
    if @item.save
      flash[:success] = "Item successfully created."
      redirect_to items_path
    else
      render :new
    end
  end
end
