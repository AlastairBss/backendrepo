# Base lightweight Python image
FROM python:3.10-slim

# Prevent Python from buffering logs
ENV PYTHONUNBUFFERED=1

# Set working directory inside container
WORKDIR /app

# Copy dependency list first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy remaining app files
COPY . .

# Expose backend port (adjust if different)
EXPOSE 8000

# Start backend server
CMD ["python", "main.py"]

