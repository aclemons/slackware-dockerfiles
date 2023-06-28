FROM aclemons/slackware:current@sha256:b34d82258d494ffbb6bd9446fd11afdb4faa8a71d8b2b5fe530b446561313d9c as full_current

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh


FROM aclemons/slackware:15.0@sha256:bfead2e71b801bdf9f97e3430d5f754d43a324709385e5d35acb0f2a10564c23 as full_150

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
