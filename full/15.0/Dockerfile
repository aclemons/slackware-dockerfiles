FROM aclemons/slackware:15.0@sha256:954b209e1900bab6109ee87edcf5b02e0b8b13077a36c63441d8689af9c88571

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
