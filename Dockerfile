# Use the official Python 3.12 image from the Docker Hub
FROM python:3.12

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the contents of the current directory on the host into /app in the container
COPY . /app

# Install Flask using pip
RUN pip install flask

EXPOSE 80

# Flask application is configured to listen on all network interfaces (0.0.0.0) and port 80, making it accessible via the EC2 instance's public IP address
CMD ["python", "app.py"]
