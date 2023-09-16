FROM aclemons/slackware:15.0@sha256:7958605c3cc4388028d9eb759aaaf21d089d72a23e80e28aef36c3cf35a42f0f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
