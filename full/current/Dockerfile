FROM aclemons/slackware:current@sha256:10da2de13ab0cdc4cab7f38bcf79751dac5d11b6585aa8c90c5f1fa118e37ba5

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
