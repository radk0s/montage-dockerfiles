FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common python-software-properties python g++ make
RUN apt-get install -y wget
RUN apt-get install -y redis-server

RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

#install Hyperflow
RUN wget https://github.com/dice-cyfronet/hyperflow/archive/v1.0.0-beta-6.tar.gz
RUN tar zxvf v1.0.0-beta-6.tar.gz
RUN mv hyperflow-1.0.0-beta-6 hyperflow
WORKDIR hyperflow
RUN npm install

#copy configuration files
RUN apt-get install -y supervisor

COPY amqpCommand.config.js /hyperflow/functions/amqpCommand.config.js
COPY data/0.1/workdir/dag.json /dag.json
COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]


