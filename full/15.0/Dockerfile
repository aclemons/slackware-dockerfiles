FROM aclemons/slackware:15.0@sha256:2b86563b28835b3fc50b8a57bf49f740c5ae3e7d46a8ebf7208168ffc5b65c9d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
