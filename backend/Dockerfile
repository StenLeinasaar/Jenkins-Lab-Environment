# Use a lightweight Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy the requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app/



# Expose the port the app runs on
EXPOSE 3000

# Run the Flask app
CMD ["python", "app.py"]
