FROM aclemons/slackware:current@sha256:a8c7609b908b89489d699701bd374089976f28a4c4beaa83104d03b0debe0824

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
