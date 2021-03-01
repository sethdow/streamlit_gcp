FROM python:3.8

WORKDIR /app

COPY requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8051

COPY . .

CMD streamlit run first_app.py --server.port 8051 --server.enableCORS false