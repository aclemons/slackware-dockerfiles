FROM aclemons/slackware:current@sha256:cf40df3c28ae3053d90f6f298fe9e7b71d0b416c537170df1d1709c71ed3a53a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
