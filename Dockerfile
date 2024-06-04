# Use the official Python 3.10 image as the base image
FROM python:3.11

# Install poetry
RUN pip install poetry

# Set the working directory inside the container
WORKDIR /hello-world-proj

# Copy only the pyproject.toml and poetry.lock files to container
COPY pyproject.toml poetry.lock ./

# Install project dependencies using poetry
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

RUN poetry check

# Copy the FastAPI application script and any other necessary files
COPY src/ src/

RUN poetry install --no-interaction --no-ansi

# Expose the port your FastAPI app will run on (adjust as needed)
EXPOSE 8080

# Command to run the FastAPI application using Uvicorn
CMD ["uvicorn", "hello_world_proj.main:app", "--host", "0.0.0.0", "--port", "8080"]
