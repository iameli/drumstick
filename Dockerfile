FROM ubuntu:wily

WORKDIR /build

ADD packages.txt /build/packages.txt
RUN apt-get update && cat packages.txt | xargs apt-get install -y

RUN cd /tmp && \
  rm -rf fish-shell && \
  git clone https://github.com/fish-shell/fish-shell.git && \
  cd fish-shell && \
  git checkout 3dbefd08ad0c306110083737f5eb7f8b938da2e3 && \
  autoconf && \
  ./configure && \
  make && \
  make install && \
  ln -s `which fish` /usr/bin/fish

ADD get-node.sh /build/get-node.sh
RUN /build/get-node.sh

RUN npm install -g babel-cli webpack grunt-cli

RUN pip install awscli

ADD init-env.fish /build/init-env.fish

RUN chmod 755 /build/init-env.fish
RUN fish /build/init-env.fish

ADD entrypoint.fish /build/entrypoint.fish
RUN chmod 755 /build/entrypoint.fish

RUN curl -L -o /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.8.3 && \
  chmod 755 /usr/bin/docker

RUN curl -Lo gcloud.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-90.0.0-linux-x86_64.tar.gz && \
tar xzvf gcloud.tar.gz && \
mkdir -p /opt && \
mv google-cloud-sdk /opt/google-cloud-sdk && \
rm -rf gcloud.tar.gz

# Boot up... and do nothing at all.
CMD /build/entrypoint.fish
