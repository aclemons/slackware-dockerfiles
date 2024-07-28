FROM aclemons/slackware:current@sha256:20baf39cca51bdd7982e0a71cac7763bce7326d02ef0c3cdd82928440c27636f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
