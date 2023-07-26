FROM aclemons/slackware:15.0@sha256:f45c6e9178b2ec55956f909c60a51d83f066afe5b54db2e91ad654e92ef9dba1

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
