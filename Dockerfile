FROM python:3.11-slim
RUN useradd appuser
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
USER appuser
CMD ["python", "app.py"]
