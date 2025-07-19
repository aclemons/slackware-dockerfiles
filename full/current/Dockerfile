FROM aclemons/slackware:current@sha256:fd5539f6c3875308774b9726c9cf2a396ce939e58ecf8b4039ace878423e12c2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
