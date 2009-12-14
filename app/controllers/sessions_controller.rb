class SessionsController < Clearance::SessionsController
  private
    def url_after_destroy
      root_path
    end
    def url_after_create
      items_path
    end
    
end