FROM aclemons/slackware:15.0@sha256:cb9e22c76fb53dcfa8e057c8d7c03d1ca05345c56398e23ca84e43fa30c7a124

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
