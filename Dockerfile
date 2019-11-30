FROM python:3.6.9-buster

RUN git clone https://github.com/codekendo/edx-dl 
RUN (cd edx-dl && pip install -r requirements.txt)
RUN pip install --upgrade youtube_dl

VOLUME /tmp/
WORKDIR /tmp/

ENTRYPOINT bash