from fastapi import FastAPI
import uvicorn
import os
from dotenv import dotenv_values
from pymongo import MongoClient
from routes.api import router as api_router

app = FastAPI()

@app.on_event("startup")
def startup_db_client():
    app.mongodb_client = MongoClient(os.environ['MONGODB_HOST'])
    app.database = app.mongodb_client[os.environ['MONGODB_DBNAME']]
    print("Project connected to the MongoDB database!")

@app.on_event("shutdown")
def shutdown_db_client():
    app.mongodb_client.close()

app.include_router(api_router)

if __name__ == '__main__': #this indicates that this a script to be run
    uvicorn.run("main:app", host='0.0.0.0', port=8000, log_level="info", reload = True)
