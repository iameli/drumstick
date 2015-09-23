FROM ubuntu:wily

WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl dnsutils git fish

ADD init-env.sh /root/.build/init-env.sh

RUN chmod 755 /root/.build/*.sh
RUN /root/.build/init-env.sh

ADD entrypoint.sh /root/.build/entrypoint.sh
RUN chmod 755 /root/.build/entrypoint.sh

# Boot up... and do nothing at all.
CMD /root/.build/entrypoint.sh
