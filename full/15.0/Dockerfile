FROM aclemons/slackware:15.0@sha256:b1c9000f3000767880679e26b5be7086dcffe2a31fc8309484d4060a7cb1dba2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
