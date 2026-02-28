FROM aclemons/slackware:15.0@sha256:64da1947610025f47a86cafb6619df8417f753a62ebddee84aa370bbf8143aa4

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
