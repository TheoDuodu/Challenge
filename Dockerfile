FROM python:3.9-slim

COPY ./hello /app/hello
COPY ./requirements.txt /app

WORKDIR /app

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "hello.main:app", "--host", "0.0.0.0", "--port", "8000"]