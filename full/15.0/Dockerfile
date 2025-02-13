FROM aclemons/slackware:15.0@sha256:425c2ab3f7cf5bcd4f0bbf0fb7f9898fc94b87f19f01715b3aa94759862e8ec7

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
