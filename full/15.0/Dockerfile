FROM aclemons/slackware:15.0@sha256:4d68c16b1467254856db03c8e12db09c3c853f9d6f98283d6f6cbe6144eb8125

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
