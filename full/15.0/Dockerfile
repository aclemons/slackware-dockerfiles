FROM aclemons/slackware:15.0@sha256:af1b10b5259ca43a5f84d9a0245a79b75fde7667cce29a7ebdaf63aa0467ebc1

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
