FROM python:3.8

WORKDIR /app

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

RUN mkdir -p /root/.streamlit

RUN bash -c 'echo -e "\
[general]\n\
email = \"\"\n\
" > /root/.streamlit/credentials.toml'

RUN bash -c 'echo -e "\
[server]\n\
enableCORS = false\n\
" > /root/.streamlit/config.toml'

EXPOSE 8501

COPY requirements.txt ./requirements.txt

RUN pip install -r requirements.txt

EXPOSE 8051

COPY . .

CMD streamlit run first_app.py