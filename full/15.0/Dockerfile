FROM aclemons/slackware:15.0@sha256:99386871b43b4f985b2ac50558605ca98fe2e17945a8f1810ed660214c8b21a2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
