FROM aclemons/slackware:15.0@sha256:a678a5fa773af127c6929f531e438ba4704072e3d5aaa4139663ab2d03ba55cd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
