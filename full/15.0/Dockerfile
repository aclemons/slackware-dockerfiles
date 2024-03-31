FROM aclemons/slackware:15.0@sha256:d71a864a04a2868f0147a5b4537a448ce335d740ef51bc4c419324077491d695

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
