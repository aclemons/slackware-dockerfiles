FROM aclemons/slackware:current@sha256:dbaecb8f4fe4914f9ec7ef219ce7327328c87e0dc8db624bd24fd447a297fa08

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
