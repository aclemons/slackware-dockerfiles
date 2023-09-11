FROM aclemons/slackware:current@sha256:d27eac14dc8ab6543b4aee5506fe108fedb504d49b3d85a56a36c932ec96ca6d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
