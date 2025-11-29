FROM aclemons/slackware:15.0@sha256:3d2b02135cc90e6b076ccbeace7963126ce3ae676e3bf9f116e2963bcfe817f8

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
