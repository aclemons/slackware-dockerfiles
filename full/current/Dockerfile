FROM aclemons/slackware:current@sha256:1051150f22dc98f92d5c2ee8a89aea0c1abadb2ee8d3c5937f3490553319bf1a

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
