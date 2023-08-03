FROM aclemons/slackware:15.0@sha256:22ff02d779235d415053a732e380e5b73a4c11106b3d1cc7d1fc4cd1c9a0c69b

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
