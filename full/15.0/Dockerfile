FROM aclemons/slackware:15.0@sha256:d13611dcd7b6be67c9c170758c12888346ad9d09942a3476b6b539a401829049

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
