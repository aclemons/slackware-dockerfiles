FROM aclemons/slackware:15.0@sha256:44532b38d845aab10a4363dd659a9688d1fcffb6956b45b4eea38552cf445164

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
