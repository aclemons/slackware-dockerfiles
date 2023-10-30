FROM aclemons/slackware:current@sha256:ba3292b369819605f2beb65eb19d6ef2bd98917c4bc94899e72d9cd2ccb6ef83

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
