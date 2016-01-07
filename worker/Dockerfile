FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common python-software-properties python g++ make

RUN apt-get install -y git curl wget
RUN apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
RUN apt-get install -y ruby2.0 ruby2.0-dev
RUN gem2.0 install --no-ri --no-rdoc mime-types hyperflow-amqp-executor

#copy configuration files
COPY executor_config.yml /executor_config.yml

#downlaod Montage binaries
WORKDIR /
RUN curl -O http://pegasus.isi.edu/montage/Montage_v3.3_patched_4.tar.gz
RUN tar zxvf Montage_v3.3_patched_4.tar.gz
WORKDIR Montage_v3.3_patched_4
RUN make
ENV PATH /Montage_v3.3_patched_4/bin:$PATH


CMD ["hyperflow-amqp-executor", "/executor_config.yml"]


