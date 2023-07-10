FROM aclemons/slackware:current@sha256:b1eeb1171a0216962d2420a03ef389418e10a6b681600bb6dd26a943b2b2ffbf

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
