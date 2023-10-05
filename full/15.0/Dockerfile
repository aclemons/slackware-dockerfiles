FROM aclemons/slackware:15.0@sha256:18630d61f310048c231790edf683e3c8252a526653f1ad371fcef82582b6f333

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
