FROM aclemons/slackware:current@sha256:8a97d2db7478825ea0ccd3086bba48ba2fbdc8e82475cacef1fa6c2a8d20c104

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
