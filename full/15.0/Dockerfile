FROM aclemons/slackware:15.0@sha256:b42aa1054921653c83df49bc8ae4eec88fb5f7f19682fd9cb223342fd3aa52cd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
