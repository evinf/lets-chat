FROM ubuntu:latest
MAINTAINER SD Elements

RUN apt-get update
RUN apt-get install -y nodejs nodejs-legacy npm git libkrb5-dev

# TODO: pull branch from environment variable?
RUN git clone -b master https://github.com/sdelements/lets-chat.git

WORKDIR lets-chat
RUN npm install

ENV database_uri mongodb://db/letschat

EXPOSE 5000

CMD ["node", "./app.js"]
