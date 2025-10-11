FROM aclemons/slackware:current@sha256:51e1eb05b1880f6605f93b51ee93b6731e65e37ccf3c9a015e7039b3cead1ba9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
