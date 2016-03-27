FROM alpine:latest

RUN apk add --update nodejs && rm -rf /var/cache/apk/*

#install Hyperflow
RUN npm install -g https://github.com/dice-cyfronet/hyperflow/archive/develop.tar.gz

COPY amqpCommand.config.js /usr/lib/node_modules/hyperflow/functions/amqpCommand.config.js
COPY dag.json /dag.json

CMD ["hflow", "run", "/dag.json", "-s"]

