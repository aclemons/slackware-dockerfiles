FROM aclemons/slackware:15.0@sha256:f4bb60bfa7183bf0841bb6ce270f3c498afe070fb44b528b9ac57da3aec4b329

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
