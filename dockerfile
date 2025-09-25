# elisa-pipeline
FROM python:3.9-slim-bullseye
WORKDIR /app
COPY requirements.txt .
RUN apt-get update && apt-get upgrade -y && apt-get clean
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8501
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
# docker build -t elisa-pipeline .
# docker run -p 8501:8501 elisa-pipeline