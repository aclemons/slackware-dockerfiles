FROM aclemons/slackware:current@sha256:200f7e23f7251ec272ee45cfd9104dba12db2a81b489b6c2fb7990f275f2f927

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
