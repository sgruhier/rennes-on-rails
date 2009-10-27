require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ItemsController do
  
  describe "get :index" do
    it "should display all items" do
      Item.should_receive :all
      get :index
      response.should be_success
    end
  end
  
  describe "get :new" do
    it "should not get :new if not logged in" do
      get :new
      response.should redirect_to new_session_path
    end

    it "should get :new if logged in" do
      sign_in
      get :new
      response.should be_success
    end
  end
  
  describe "create a  new item" do
    before do
      sign_in
    end
    
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

end
