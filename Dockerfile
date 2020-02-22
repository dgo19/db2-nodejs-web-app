FROM docker.io/node:buster

WORKDIR /opt
RUN git clone https://github.com/DB2-Samples/db2nodejs.git && \
    cd db2nodejs && \
    npm install && \
    chgrp -R 0 /opt/db2nodejs && \
    chmod -R g=u /opt/db2nodejs && \
    mkdir -p /usr/local/bin \
    chmod g=u /etc/passwd

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

USER 1001
EXPOSE 8888

WORKDIR /opt/db2nodejs

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD npm run start
