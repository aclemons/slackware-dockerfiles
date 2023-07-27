FROM aclemons/slackware:current@sha256:b571cd4695be87b608f5e03a5d30a55bb5fd5c11b764b68fba5fc23ff8c37446

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
