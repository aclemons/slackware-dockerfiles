FROM aclemons/slackware:15.0@sha256:c179e52e32de56eadd72a5b73bb3e4efe85575cef1862e2e97b3cd9163333508

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
