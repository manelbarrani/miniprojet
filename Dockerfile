FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://ollama.com/install.sh | sh && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/usr/local/bin"

COPY requirements.txt .
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

RUN ollama pull mistral


CMD ["sh", "-c", "ollama serve & sleep 5 && uvicorn main:app --host 0.0.0.0 --port 10000"]