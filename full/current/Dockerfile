FROM aclemons/slackware:current@sha256:a96832cc95d18dab440eff17bc0233ec22d7caffaaa6a6b970681778db17ab19

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
