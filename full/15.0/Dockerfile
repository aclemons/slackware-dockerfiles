FROM aclemons/slackware:15.0@sha256:20ca7c42e54830c9e46332c8b652c0707a76ee52cbdf385745fbe2d3679eb5e6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
