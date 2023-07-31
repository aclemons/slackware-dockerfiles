FROM aclemons/slackware:current@sha256:ca6d7af6c160c41b7234bd94a56f44c250ab30ab5a8c76e3904d2395d58cd0ea

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
