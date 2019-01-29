FROM python:3.7-alpine

RUN apk update && \
    apk add build-base libffi-dev openssl-dev

RUN mkdir /app
WORKDIR /app

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD ./src /app
VOLUME [ "/app/data" ]

EXPOSE 8443

CMD [ "python", "./gatebot.py" ]
