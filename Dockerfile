# Use an official Python runtime as a parent image
FROM python:3.5-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD ./import /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Download simple-line-notify-server from git
RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/llPandora/simple-line-notify-server.git

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
# ENV NAME World

# Run app.py when the container launches
CMD ["python", "simple-line-notify-server/main.py"]
