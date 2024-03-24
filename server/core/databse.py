from pymongo import MongoClient
import certifi
from .settings import get_settings

settings = get_settings()

client = MongoClient(settings.DB_URL, tlsCAFile = certifi.where())

try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)