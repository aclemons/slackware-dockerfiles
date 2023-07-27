FROM aclemons/slackware:15.0@sha256:6dcfd273785c24fe1c99507f69a75dbda5f575ccc2321a988dab360b04be2814

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
