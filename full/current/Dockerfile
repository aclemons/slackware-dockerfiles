FROM aclemons/slackware:current@sha256:98fd43e33fcd8a5b8cd02c77ffefbd21251bdc60648c41372678e7190d3ed18a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
