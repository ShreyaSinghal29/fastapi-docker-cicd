# Use Ubuntu as base image
FROM ubuntu:latest

# Install Python and dependencies
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Create a virtual environment and activate it
RUN python3 -m venv /app/venv

# Use the virtual environment for installation
RUN /app/venv/bin/pip install --no-cache-dir -r requirements.txt

# Expose the port
EXPOSE 8000

# Use the virtual environment to run FastAPI
CMD ["/app/venv/bin/uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
