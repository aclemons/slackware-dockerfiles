FROM aclemons/slackware:current@sha256:39af86740d2f5cb45c6b782db6d11cfd1674ba3f09d9151e55dfba8c389b9806

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
