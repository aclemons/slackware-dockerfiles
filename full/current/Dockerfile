FROM aclemons/slackware:current@sha256:58d497054d05df1abc2671cc214869d28cc6f500ba186e698316f2142751de4d

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
