import streamlit as st
import os
from google.cloud import secretmanager


secrets = secretmanager.SecretManagerServiceClient()

# This is passed in as an environ by default?
PROJECT_ID = os.environ.get("PROJECTID")

SECRET_VALUE = secrets.access_secret_version(request={"name": "projects/"+PROJECT_ID+"/secrets/example-secret/versions/1"}).payload.data.decode("utf-8")

st.write('This is your steamlit app')
st.write('EXAMPLE SECRET: ' + SECRET_VALUE)
