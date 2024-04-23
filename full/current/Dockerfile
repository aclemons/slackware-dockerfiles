FROM aclemons/slackware:current@sha256:fd10e52787a64200c82a1d531679c3c05e2becf353a036ec12bddb8bd7432660

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
