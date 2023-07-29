FROM aclemons/slackware:current@sha256:1b949166f3debb242c020087206071ca49e7a3e7da91c511b0aa4010664b766c

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
