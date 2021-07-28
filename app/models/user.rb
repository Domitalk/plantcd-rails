class User < ApplicationRecord
    # so that bcrypy passwords work 
    has_secure_password
end
