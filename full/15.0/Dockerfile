FROM aclemons/slackware:15.0@sha256:54b8994a24600312bc197225e35c994eb7376abbd9727ed8fdcfd53b1f7e8241

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
