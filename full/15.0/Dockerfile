FROM aclemons/slackware:15.0@sha256:1c1d33386c48bf89836dda3a0841854a0e74d70d16dc690c89fc0bab708a230b

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
