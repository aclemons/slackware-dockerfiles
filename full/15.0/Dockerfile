FROM aclemons/slackware:15.0@sha256:2cbfd37f8293dfd59bbb7ea334dac7578bd5976384d3eafe037a549013371aed

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
