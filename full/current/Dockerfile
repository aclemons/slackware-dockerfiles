FROM aclemons/slackware:current@sha256:23c0d35a8aa746ce40bd903299ad7d2fce44555ece39a99e83499220cdf2af14

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
