FROM aclemons/slackware:current@sha256:dd313c0c273f18b6593421fcc5b53a25ce80d01332d90453db0d73bb7ed29594

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
