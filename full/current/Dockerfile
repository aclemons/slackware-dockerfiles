FROM aclemons/slackware:current@sha256:b207476e04b973b191a3cda74ba937e530eecca33afc03abbce95e5fcc15d357

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
