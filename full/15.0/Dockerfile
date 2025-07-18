FROM aclemons/slackware:15.0@sha256:6c34ba499bb7cdb13d89ecf345e042ec436a03dffb07335701478bc9f3633aad

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
