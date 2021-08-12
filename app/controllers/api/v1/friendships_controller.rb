class FriendshipsController < ApplicationController
    protect_from_forgery with: :exception

    def create
        # this is basically a friendship invite 
        Friendship.create_reciprocal_for_ids(
            current_user_id, 
            params[:friend_id]
        )

        # need to render json a confirm of the friendship request/ friendship confirmation ? 
    end

    def update 
        # this is basically a friendship confirmation wherein the update will change the :confirm to true 

    end 

    def destroy
        # this will be called when friendship is denied or else defriended 
        Friendship.destroy_reciprocal_for_ids(
            current_user_id, 
            params[:friend_id]
        )
        
    end

end
