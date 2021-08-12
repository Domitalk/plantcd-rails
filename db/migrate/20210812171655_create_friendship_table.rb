class CreateFriendshipTable < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :friend
      t.boolean :confirmed, default: :false 

      t.timestamps 
    end
  end
end
