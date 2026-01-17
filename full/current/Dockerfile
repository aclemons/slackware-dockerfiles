FROM aclemons/slackware:current@sha256:1d22b433cc8592ef678de74a7932fb0f2b1e8ab5a1469da9842623db29ec2c1e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
