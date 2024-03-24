from auth.models import User


def user_to_dict(user:User):
    return {
        'id':user.id,
        'first_name':user.first_name,
        'last_name':user.last_name,
        'email':user.email,
        'username':user.username
    }
    

def user_from_dict(data:dict):
    return User(**data)