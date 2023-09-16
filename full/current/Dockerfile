FROM aclemons/slackware:current@sha256:1aa9924dbaae9367136a595c7f510691d96d63a54f5bd945ddb1ca1f8663c4b6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
