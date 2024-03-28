FROM aclemons/slackware:current@sha256:6b530a4713b96533a5365584311ca58b24d6af89dfb0708433894aafec7d5037

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
