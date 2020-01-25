FROM node:buster

RUN apt-get -y install git && apt-get clean && mkdir /opt
WORKDIR /opt
RUN git clone https://github.com/DB2-Samples/db2nodejs.git && \
    cd db2nodejs
    npm install

USER 1001

WORKDIR /opt/db2nodejs

ENTRYPOINT ["npm", "run", "start"]
