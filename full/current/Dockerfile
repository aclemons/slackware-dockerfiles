FROM aclemons/slackware:current@sha256:8a788e7edf6a35488ba62abb40cf19d12e619a066cbf95bb84d139dadb60d8f1

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
