class ItemsController < ApplicationController
  before_filter :authenticate 
  before_filter :find_item, :only => [:edit, :update, :destroy, :show]
  
  def index
    @items = current_user.items.paginate :page => params[:page]
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
  
  def edit
  end
  
  def update
    if @item.update_attributes params[:item]
      
      flash[:success] = "Item successfully updated."
      redirect_to items_path
    else
      render :edit
    end
  end
  
  def destroy
    flash[:success] = "Item successfully deleted."
    
    @item = current_user.items.find params[:id]
    @item.destroy

    redirect_to items_path(:page => params[:page])
  end
  
  def show
  end
  
private
  def find_item
    @item = current_user.items.find params[:id]
  end
end
