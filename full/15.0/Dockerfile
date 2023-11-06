FROM aclemons/slackware:15.0@sha256:2cc02302b0fef5549e011574c9471b95ce0bf5d04c0ac40a65e28550b1a16762

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
