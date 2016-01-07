FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y openssh-server apache2 supervisor
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common python-software-properties python g++ make

RUN apt-get install -y git curl wget
RUN apt-get install -y rabbitmq-server redis-server
RUN apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
RUN apt-get install -y ruby2.0 ruby2.0-dev
RUN gem2.0 install --no-ri --no-rdoc mime-types hyperflow-amqp-executor

RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs
ą
#install Hyperflow
RUN wget https://github.com/dice-cyfronet/hyperflow/archive/v1.0.0-beta-6.tar.gz
RUN tar zxvf v1.0.0-beta-6.tar.gz
RUN mv hyperflow-1.0.0-beta-6 hyperflow
WORKDIR hyperflow
RUN npm install
#ENV PATH /hyperflow/bin:$PATH

#downlaod Montage binaries
WORKDIR /
RUN curl -O http://pegasus.isi.edu/montage/Montage_v3.3_patched_4.tar.gz
RUN tar zxvf Montage_v3.3_patched_4.tar.gz
WORKDIR Montage_v3.3_patched_4
RUN make
ENV PATH /Montage_v3.3_patched_4/bin:$PATH

#prepare Montage data
#RUN mkdir data
#WORKDIR data
#RUN wget https://gist.github.com/kfigiela/9075623/raw/dacb862176e9d576c1b23f6a243f9fa318c74bce/bootstrap.sh
#RUN chmod +x bootstrap.sh
#RUN ./bootstrap.sh 0.1

#RUN nodejs /hyperflow/scripts/dax_convert_amqp.js 0.1/workdir/dag.xml amqpCommand > 0.1/workdir/dag.json

#copy configuration files
COPY supervisor.conf /etc/supervisor/conf.d/supervisord.conf
COPY amqpCommand.config.js /hyperflow/functions/amqpCommand.config.js
COPY executor_config.yml /executor_config.yml
COPY data /data

CMD ["/usr/bin/supervisord"]


