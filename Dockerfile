FROM docker.io/node:buster

WORKDIR /opt
RUN git clone https://github.com/DB2-Samples/db2nodejs.git && \
    cd db2nodejs && \
    npm install

USER 1001

WORKDIR /opt/db2nodejs

ENTRYPOINT ["npm", "run", "start"]
