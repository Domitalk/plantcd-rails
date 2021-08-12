class User < ApplicationRecord
    # so that bcrypy passwords work 
    has_secure_password
    has_many :friendships, dependent: :destroy
    has_many :friends, through: :friendships


    
end
