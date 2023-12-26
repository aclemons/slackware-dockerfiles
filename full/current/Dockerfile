FROM aclemons/slackware:current@sha256:a69dc35ce7cfec188d03e81b4be17e7ddd5d120b92119a62b34cdbe7c00ddb5a

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
