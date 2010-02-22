require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do
  before do
    sign_in_as :user_with_items
  end
  
  describe "get :index" do
    it "should display all items" do
      get :index
      response.should be_success
      assigns(:items).should == @current_user.items
      
      assigns(:items).length.should == 2
    end
  end
  
  describe "get :new" do
    it "should get :new if logged in" do
      get :new
      response.should be_success
    end
  end
  
  describe "create a  new item" do
    it "should create a valid item" do
      lambda {
        lambda {
          post :create, :item => {:title => "title", :description => "description"}
          response.should redirect_to(items_path)
        }.should change(@current_user.items, :count).by(1)
       }.should change(Item, :count).by(1)
    end
    
    it "should not create an invalid item" do
      lambda {
        post :create, :item => {:description => "description"}
        response.should render_template(:new)
      }.should_not change(@current_user.items, :count)
    end
  end

  describe "get :edit" do
    it "should display edit page" do
      get :edit, :id => @current_user.items.first
      response.should be_success
    end
  end
  
  describe "puts :update" do
    it "should update an item" do
      put :update, :id => @current_user.items.first, :item => {:title => 'foo'}
      response.should redirect_to(items_path)
      
      @current_user.items.first.title.should == 'foo'
      flash[:success].should_not be_nil
    end
  end
  
  describe "delete :destroy" do
    it "should remove an item" do
      lambda {
        delete :destroy, :id => @current_user.items.first
        response.should redirect_to(items_path)
      }.should change(@current_user.items, :count).by(-1)
    end
  end
end
