FROM aclemons/slackware:15.0@sha256:d94b57582f61a81192e6a9dbcf14c05569d22956d5e3b2f579c2e27871c57f3f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
