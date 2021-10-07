class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"

    def self.create_friendships(user_id, friend_id)

    # when req created ... Friendship.create(friend_id: user_id, user_id: friend_id) 
    # then once confirmed from the other user, Friendship.create(friend_id: user_id, user_id: friend_id) again because now the two roles are reversed 


        creator_friendship = Friendship.create(user_id: user_id, friend_id: friend_id)
        target_friendship = Friendship.create(user_id: friend_id, friend_id: user_id)

        [creator_friendship, target_friendship]
    end

    def self.destroy_friendships(user_id, friend_id)
        destroyer_friendship = Friendship.find_by(user_id: user_id, friend_id: friend_id)
        target_friendship = Friendship.find_by(user_id: friend_id, friend_id: user_id)

        destroyer_friendship.destroy
        target_friendship.destroy
    end

    def self.confirm_friendship(user_id, friend_id)
        # maybe have another arg here so that we can confirm that the req == the proper path 

        # find user_friendship and change :confirm to true 
        user_friendship = Friendship.find(user_id: user_id, friend_id: friend_id)
        user_friendship.update(confirmed: true)

        # after we update, and validate, create a reversed Friendship with confirmed: true 
        friend_friendship = Friendship.find(user_id: friend_id, friend_id: user_id)
        friend_friendship.update(confirmed: true)

        [user_friendship, friend_friendship]
    end 

    private

end
