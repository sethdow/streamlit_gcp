FROM python:3.8

WORKDIR /app

COPY requirements.txt ./requirements.txt
# remember to expose the port your app'll be exposed on.
EXPOSE 8080


RUN pip3 install -r requirements.txt

# copy into a directory of its own (so it isn't in the toplevel dir)
COPY . .


# run it!
CMD streamlit run --server.port 8080 --server.enableCORS false app.py
