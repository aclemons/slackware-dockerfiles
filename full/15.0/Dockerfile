FROM aclemons/slackware:15.0@sha256:bf712166b0203cb39d4547ca2636109734e675a757e5a52cf717a8be0161f93e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
