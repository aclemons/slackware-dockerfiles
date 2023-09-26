FROM aclemons/slackware:current@sha256:ae64173ea662547cc2bd35ece0bb3e5d70e5751dd1ed7f1c1c93807800dd9e3e

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
