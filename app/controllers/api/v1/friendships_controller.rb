
class Api::V1::FriendshipsController < ApplicationController
    # this route needs some auth + exemptions for until the product is finished 
    # protect_from_forgery with: :exception

    def create
        #  a friendship invite 
        @friendships = Friendship.create_friendships(
            friendship_params[:user_id], 
            friendship_params[:friend_id]
        )
        
        render json: @friendships.to_json 
     
        # need to render json a confirm of the friendship request/ friendship confirmation ? 
    end

    def update 
        # a friendship confirmation wherein the update will change the :confirm to true 
        @confirmArray = Friendship.confirm_friendship(friendship_params[:user_id], friendship_params[:friend_id])

        render json: @confirmArray.to_json
    end 

    def destroy
        # called when friendship is denied or else defriended 
        Friendship.destroy_friendships(
            friendship_params[:user_id], 
            friendship_params[:friend_id]
        )

    end
    
    private 

    def friendship_params 
        # i think this prob needs to be fixed to match what the frontend is going to send 
        params.permit(:user_id, :friend_id)

    end 


end
