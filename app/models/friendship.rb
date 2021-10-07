class Friendship < ApplicationRecord
    belongs_to :user
    belongs_to :friend, class_name: "User"

    def self.create_friendships(user_id, friend_id)
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

    def self.confirm_friendship 
        # find user_friendship and change :confirm to true 
        # find friend_friendship and change :confirm to true 

        [user_friendship, friend_friendship]
    end 

    private

end
