FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y software-properties-common python-software-properties python g++ make

RUN apt-get install -y git curl wget

RUN curl -sL https://deb.nodesource.com/setup_4.x | sh

RUN apt-get install -y nodejs

RUN npm install -g https://github.com/dice-cyfronet/hyperflow/archive/develop.tar.gz

WORKDIR /
RUN curl -O http://student.agh.edu.pl/~chamot/Montage_v3.3_patched_4.tar.gz
RUN tar zxvf Montage_v3.3_patched_4.tar.gz
WORKDIR Montage_v3.3_patched_4
RUN make
ENV PATH /Montage_v3.3_patched_4/bin:$PATH

WORKDIR /data
COPY bootstrap.sh /data/bootstrap.sh

CMD ["/bin/bash"]
