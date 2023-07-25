FROM aclemons/slackware:current@sha256:80de4a37c34900c84d7c63adec239e115cbdea990e1de6d2067cb0951423adf8

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
