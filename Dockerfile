# Use the official Python 3.12 image from the Docker Hub
FROM python:3.12

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the contents of the current directory on the host into /app in the container
COPY . /app

# Install Flask using pip
RUN pip install flask

# Specify the command to run the Flask app when the container starts
CMD ["python", "app.py"]
