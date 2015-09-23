FROM ubuntu:wily

WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl dnsutils git fish vim sudo man

ADD init-env.fish /root/.build/init-env.fish

RUN chmod 755 /root/.build/init-env.fish
RUN fish /root/.build/init-env.fish

ADD entrypoint.fish /root/.build/entrypoint.fish
RUN chmod 755 /root/.build/entrypoint.fish

# Boot up... and do nothing at all.
CMD /root/.build/entrypoint.fish
