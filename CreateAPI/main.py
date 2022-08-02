# https://anderfernandez.com/en/blog/how-to-create-api-python/#:~:text=To%20create%20an%20API%20in%20Python%20with%20Flask%2C%20we%20have,app%20%3D%20Flask()%20%40app.

from fastapi import FastAPI

app = FastAPI()

@app.get("/my-first-api")
def hello(name = None):

    if name is None:
        text = "Hello!"

    else:
        text = "Hello " + name + "!"
    
    return text