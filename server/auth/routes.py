from fastapi import APIRouter, Body, status
from fastapi.responses import JSONResponse
from core.databse import client
from fastapi.exceptions import HTTPException
from .utils import get_hashed_password
from .models import User, UserSignUp, UserSignIn

router = APIRouter(prefix='/auth')


@router.post('/signup', response_class=JSONResponse)
async def signup(user:UserSignUp):
    '''
    Creates a new user
    raise HttpException if user already exists
    '''
    #check if user already exists
    if client.campus_connect.users.find_one({'username':user.username}):
        raise HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail='account already exists with this username.')
    if client.campus_connect.users.find_one({'email':user.email}):
        raise HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail='account already exists with this email.')
    # create user
    user_data = User(**user.model_dump()).model_dump(exclude=['id'])
    user_data['password'] = get_hashed_password(user.password)
    client.campus_connect.users.insert_one(user_data)
    return {'message':f'account created!, please verify account by email sent to {user.email}'}


@router.post('/signin')
async def signin(user:UserSignIn):
    return user