FROM python:3.9

# Set the working directory inside the container
WORKDIR /code

# Copy and install the dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the FastAPI app code into the container
COPY ./app /code/app

# Expose the port
EXPOSE 8000

# Default command (production), overridden by docker-compose.dev.yml for dev
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
