FROM aclemons/slackware:current@sha256:22834314c2c708fb5fdb1d7078b9dc5ab671e2d269ca910e997ee994dda5c181 as full_current

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh


FROM aclemons/slackware:15.0@sha256:bfead2e71b801bdf9f97e3430d5f754d43a324709385e5d35acb0f2a10564c23 as full_150

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
