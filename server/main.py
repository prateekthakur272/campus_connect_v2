from fastapi import FastAPI, WebSocket
from uvicorn import run
from auth.routes import router as auth_router

app = FastAPI()

app.include_router(auth_router)

if __name__ == '__main__':
    run('main:app',reload= True)