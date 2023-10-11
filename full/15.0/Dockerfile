FROM aclemons/slackware:15.0@sha256:0618cef57c6cd0f1ebe09c7de8f71057a2b55327b0a49559f6dd5461ede01f19

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
