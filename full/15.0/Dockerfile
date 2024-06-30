FROM aclemons/slackware:15.0@sha256:c9fc756005a4870dea766ecce63202ee0648ce288203b0c348ea5c52f76ad3ce

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
