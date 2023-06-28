FROM aclemons/slackware:current@sha256:b34d82258d494ffbb6bd9446fd11afdb4faa8a71d8b2b5fe530b446561313d9c as full_current

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh


FROM aclemons/slackware:15.0@sha256:af1b10b5259ca43a5f84d9a0245a79b75fde7667cce29a7ebdaf63aa0467ebc1 as full_150

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
