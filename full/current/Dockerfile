FROM aclemons/slackware:current@sha256:3ccdb714ec25a89ecbbe70c09ef2cca8af375bb934d634db2c091ea5ed20bbe3

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
