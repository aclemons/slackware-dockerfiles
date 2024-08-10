FROM aclemons/slackware:15.0@sha256:0b7f30638260f657d6e93ff6771f5669bfce27035d71af8b7e26c2ed3b3e898d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
