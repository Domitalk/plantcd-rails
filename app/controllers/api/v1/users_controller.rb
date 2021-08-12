class Api::V1::UsersController < ApplicationController
    # this allows users#create to bypass authorized 
    # can add anything here to allow for testing or else take the jwt token from /login and send it with header in the postman request 
    skip_before_action :authorized, only: [:create]
    # this forces users#show to get authorized first 
    before_action :authorized
    # before_action :authorized, only: [:show]


    def create 
        @user = User.create(user_params)

        if @user.valid?
            token = encode_token({ user_id: @user.id })

            render json: { user: @user, jwt: token }, status: :accepted
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end

    end 

    def show
        @user = User.find(params[:id])

        #####################
        # TAKE OUT THE BUSINESS LOGIC OF CREATING A GOOD JSON SHAPE FOR THE API IN THE MODELS FOR USER 
        # replace the @users.to_json with the new helper so it's @user.reshape_to_json

        # need a new helper for the api so that friends are also returned for the user but only the ones in which friendships are confirmed 
        @confirmed_friends = @user.friends.select do |friend|
            friend.confirmed
        end 
        #####################

        render json: @user.to_json
    end 

    def index 
        @users = User.all 
        render json: @users.to_json 
    end 
        
    private 

    def user_params 
        params.require(:user).permit(:user_name, :password)
    end 

end
