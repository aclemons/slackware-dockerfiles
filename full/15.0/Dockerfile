FROM aclemons/slackware:15.0@sha256:d72df2bc4a164509a9cac9f340c731e0676fe69bf894e92e060b1854b779a2c5

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
