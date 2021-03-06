# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all 
Friendship.destroy_all

User.create(
    user_name: 'user_name_1',
    password: '123'
)
User.create(
    user_name: 'user_name_2',
    password: '123'
)
User.create(
    user_name: 'user_name_3', 
    password: '123'
)

User.create(
    user_name: 'user_name_3', 
    password: '123'
)

Friendship.create(
    user: User.first,
    friend: User.last,
)

Friendship.create(
    user: User.first, 
    friend: User.second 
)

Friendship.first.update(
    confirmed: true 
)


