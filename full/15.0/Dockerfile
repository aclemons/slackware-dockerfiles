FROM aclemons/slackware:15.0@sha256:43b2a8666f4be88973a4487cde44cb3e0caa15373abe5da69b000b3fefdff936

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
