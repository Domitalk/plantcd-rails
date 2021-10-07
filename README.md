<!-- TO-DO  -->
<!-- make json shaper helper  -->


users#show (with jwt token in header)
GET 
http://localhost:3000/api/v1/users/1
<!-- no need for any body b/c the JWT is in header  -->

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