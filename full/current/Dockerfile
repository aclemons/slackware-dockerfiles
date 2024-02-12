FROM aclemons/slackware:current@sha256:df89639979f1ce0bba81b0520c2f6107375abd9353301cae1182b74d177d1326

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
