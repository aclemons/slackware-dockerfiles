FROM aclemons/slackware:15.0@sha256:0cf8eadfac2d04c3b6636c0b3f43faa2f9a9ed9a22b1471819883fb678c8ebc4

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
