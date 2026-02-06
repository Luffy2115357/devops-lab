FROM python:3.9-slim

WORKDIR /app

# Copy requirements first (DevOps Best Practice for speed)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Now copy the rest of the code and the templates folder
COPY . .

# Tell Docker the app is on port 5000
EXPOSE 5000

# Run the NEW app file
CMD ["python", "app.py"]

