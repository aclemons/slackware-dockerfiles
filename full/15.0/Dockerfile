FROM aclemons/slackware:15.0@sha256:7a989863f9eeb116b28d27e8821070e66314a231c34a782bd2494b75cf7c27df

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
