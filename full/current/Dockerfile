FROM aclemons/slackware:current@sha256:d2486923f0e934f2f8c9b221d841e18013618070ca820a2ca547ee5bdeca4976

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
