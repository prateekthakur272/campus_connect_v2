from passlib.context import CryptContext
from core.settings import get_settings
from datetime import datetime, timedelta
import jwt


password_context = CryptContext(schemes=['bcrypt'], deprecated='auto')
settings = get_settings()

def get_hashed_password(raw_password:str) -> str:
    return password_context.hash(raw_password)

def verify_password(raw_password:str, hashed_password:str) -> bool:
    return password_context.verify(raw_password, hashed_password)

def generate_access_token(payload:dict) -> str:
    token_payload = payload.copy()
    exp = datetime.utcnow() + timedelta(minutes=settings.JWT_EXPIRATION_TIME)
    token_payload.update({'exp':exp})
    access_token = jwt.encode(token_payload, settings.SECRET_KEY, algorithm=settings.JWT_ALGORITHM)
    return access_token

def generate_refresh_token(payload:dict) -> str :
    refresh_token = jwt.encode(payload, settings.SECRET_KEY, algorithm=settings.JWT_ALGORITHM)
    return refresh_token

def get_payload(token:str) -> dict|None:
    try:
        data = jwt.decode(token, settings.SECRET_KEY, algorithms=[settings.JWT_ALGORITHM])
    except jwt.PyJWTError:
        return None