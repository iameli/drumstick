FROM ubuntu:wily

WORKDIR /build

ADD packages.txt /build/packages.txt
RUN apt-get update && cat packages.txt | xargs apt-get install -y

ADD get-node.sh /build/get-node.sh
RUN /build/get-node.sh

RUN npm install -g babel webpack

RUN pip install awscli

ADD init-env.fish /build/init-env.fish

RUN chmod 755 /build/init-env.fish
RUN fish /build/init-env.fish

ADD entrypoint.fish /build/entrypoint.fish
RUN chmod 755 /build/entrypoint.fish

RUN curl -L -o /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.8.3 && \
  chmod 755 /usr/bin/docker

# Boot up... and do nothing at all.
CMD /build/entrypoint.fish
