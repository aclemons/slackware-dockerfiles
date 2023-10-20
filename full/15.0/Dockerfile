FROM aclemons/slackware:15.0@sha256:0ac7dbb251e78f1fc06a96ce2d71859391cb41587162c03a58634daf51ea186a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
