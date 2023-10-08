FROM aclemons/slackware:15.0@sha256:f2b12e5053feb1f4a6d5db52468c72ef441d8855da3a9d6d26773cc1f1cb4857

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
