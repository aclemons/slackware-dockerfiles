FROM aclemons/slackware:15.0@sha256:3763bc6a6acc9c66060e874a35d698c149b870a8cebfdf6620a2c778f5f91711

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
