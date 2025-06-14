FROM aclemons/slackware:15.0@sha256:1bc7e15f92e97c1e73683184beecb891e724e351d8141271eabf5ed7b5beaa94

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
