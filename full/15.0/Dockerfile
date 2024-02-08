FROM aclemons/slackware:15.0@sha256:f03654b5540e28cd9263580519844d531e68bc5885a4bfcc70a335871e23f433

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
