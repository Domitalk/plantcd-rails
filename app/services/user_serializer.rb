class UserSerializer
    def initialize(user_object)
        @user = user_object 

        @confirmed_friends = @user.friendships.select do |friendship|
            friendship.confirmed
        end 

        @confirmed_with_names = @confirmed_friends.map  do |friend| 
            {
                friend_id: friend.friend_id, 
                created_at: friend.created_at, 
                updated_at: friend.updated_at, 
                friend_user_name: User.find(friend.friend_id).user_name
            }
        end 

        @final_user = {
            id: @user.id, 
            user_name: @user.user_name, 
            friends: @confirmed_with_names 
        }
        # filter out unconfirmed users 
    end 

    def to_serialized_json
        options = {
            inlcude: {
                friends: {
                    only: [:friend_id, :created_at, :updated_at, :friend_user_name]
                }
            }, 
            except: [:created_at, :updated_at, :password_digest]
        }
        @final_user.to_json(options)
    end 
end 