# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages and osmium-tool
RUN apt-get update && apt-get install -y \
    osmium-tool \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install JupyterLab
RUN pip install --no-cache-dir jupyterlab

# Set up a working directory
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Expose the port for JupyterLab
EXPOSE 8888

# Command to start JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

# Add a volume mount point
VOLUME ["/data"]