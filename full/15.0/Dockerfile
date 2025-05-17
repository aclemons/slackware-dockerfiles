FROM aclemons/slackware:15.0@sha256:686a9933e3b1b4519c9299ec4396eb755d5d0ff36cb29052e1e0902c30799c05

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
