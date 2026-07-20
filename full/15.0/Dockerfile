FROM aclemons/slackware:15.0@sha256:35ab2753646cc08476f550b3b4a0221de0d34ed23e69f2a6a3152074ebe9243d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
