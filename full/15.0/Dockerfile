FROM aclemons/slackware:15.0@sha256:aa858df3965dc9fbb8e714aab7b6a102d2e7df5434e3911843be085ec8ea2435

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
