FROM aclemons/slackware:15.0@sha256:4c4f8272218e34cf7810086d57ddb30ae97c47d463553eddd94de1fd2c863aaa

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
