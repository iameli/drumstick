FROM ubuntu:wily

WORKDIR /build

ADD packages.txt /build/packages.txt
RUN apt-get update && cat packages.txt | xargs apt-get install -y

ADD get-node.sh /build/get-node.sh
RUN /build/get-node.sh

ADD init-env.fish /build/init-env.fish

RUN chmod 755 /build/init-env.fish
RUN fish /build/init-env.fish

ADD entrypoint.fish /build/entrypoint.fish
RUN chmod 755 /build/entrypoint.fish

# Boot up... and do nothing at all.
CMD /build/entrypoint.fish
