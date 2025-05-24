FROM aclemons/slackware:current@sha256:46e1f7243ae9acee1d235725385d4a5507c77aee71997c7ba19351eadcc98a76

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
