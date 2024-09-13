FROM python:3.9-alpine

# Creating a non-root user as done previously
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY . /app

# Ensure any dependencies are installed
RUN pip install --no-cache-dir -r requirements.txt

# Run as the non-root user
USER appuser

# Command to run your application
CMD ["python", "app.py"]
