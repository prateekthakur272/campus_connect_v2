from pydantic import BaseModel, Field
from pydantic import EmailStr
    

class User(BaseModel):
    id:str = Field(min_length=10, max_length=50, default='')
    first_name:str = Field(min_length=3, max_length=40)
    last_name:str = Field(max_length=40)
    username:str = Field(max_length=20, min_length=4)
    email:EmailStr = Field(max_length=50)
    password:str = Field()
    is_active:bool = Field(default=False)
    type:str = Field(max_length=10, default='user')
    

class UserSignIn(BaseModel):
    username:str = Field(min_length=4, max_length=20)
    password:str = Field(min_length=8, max_length=32)
    

class UserSignUp(BaseModel):
    first_name:str = Field(min_length=3, max_length=40)
    last_name:str = Field(max_length=40)
    username:str = Field(max_length=20, min_length=4)
    email:EmailStr = Field(max_length=50)
    password:str = Field(min_length=8, max_length=32)
