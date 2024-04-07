FROM aclemons/slackware:15.0@sha256:926e31d5fd733b0d89ea0dee60a530a42c98279b6420a4f361c9eba5ed1646d6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
