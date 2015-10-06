FROM ubuntu:wily

WORKDIR /build

RUN apt-get update && apt-get install -y \
    curl dnsutils git fish vim sudo man

ADD init-env.fish /build/init-env.fish

RUN chmod 755 /build/init-env.fish
RUN fish /build/init-env.fish

ADD entrypoint.fish /build/entrypoint.fish
RUN chmod 755 /build/entrypoint.fish

# Boot up... and do nothing at all.
CMD /build/entrypoint.fish
