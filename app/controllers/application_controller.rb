class ApplicationController < ActionController::API

    # test db
    def index 
        @users = User.all 
        render json: @users.to_json 
    end 

end
