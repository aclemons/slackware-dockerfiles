FROM aclemons/slackware:15.0@sha256:579a3edd97d06500ff64f6e220d9037a301d41c5292474e204ea63fd574f9672

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
