FROM aclemons/slackware:current@sha256:5229bedb561fba7a146980a388cade02dfb2da0a574b041df246ddb6399cbee6

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
