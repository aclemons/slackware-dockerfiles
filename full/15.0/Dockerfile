FROM aclemons/slackware:15.0@sha256:5bd9c33d3789feae03943f9989a7351bca1078d5cfcc8878f9f72f7bc9c99479

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
