from http import HTTPStatus
import uvicorn
from fastapi import FastAPI, Response
from pydantic import BaseModel


class PostInput(BaseModel):
    name: str = "arezoo"
    age: int

app = FastAPI()


@app.get("/")
async def root() -> Response:
    return Response(content="hello world", status_code=HTTPStatus.OK)
    # return {"message": "Hello World"}


@app.get("/hello")
async def hello_func():
    return {"message": " Hello to yourself"}


@app.post("/hello")
async def hello_post(hello:PostInput):
    return {"message": f"Hello {hello.name} with age {hello.age}"}


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8080, log_level="debug")  # type: ignore
