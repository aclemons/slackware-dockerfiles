FROM aclemons/slackware:15.0@sha256:68c9d53695c9f4f25ef94420075d06b7119dce3baae0c758cdbefe3eb38f9345

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
