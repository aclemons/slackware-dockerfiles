FROM aclemons/slackware:current@sha256:17a2481a06cd3f203fd188b12fd44042be9c8b573490e6abb47013f2e79abe4a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
