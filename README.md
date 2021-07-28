users#show (with jwt token in header)
GET 
http://localhost:3000/api/v1/users/1
{ 
    "user": 
    { 
        "user_name": "user_name_1", 
        "password": "123"
    }
}

auth#create (/login)
POST 
http://localhost:3000/api/v1/login

{ 
    "user": 
    { 
        "user_name": "user_name_1", 
        "password": "123"
    }
}

users#create (making a new user) 
POST 
http://localhost:3000/api/v1/users 
{ 
    "user": 
    { 
        "user_name": "user_name_1", 
        "password": "123"
    }
}