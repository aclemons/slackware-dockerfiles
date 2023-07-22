FROM aclemons/slackware:current@sha256:61186152e0d1d4401d8a2c1fe73351c83557de5554b73973e1c35d129cdbe8ca

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
