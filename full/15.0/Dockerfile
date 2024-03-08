FROM aclemons/slackware:15.0@sha256:1d558eb4f59dc8681884871946a72b910145310c0c5f8a44ae297f3ddd647518

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
