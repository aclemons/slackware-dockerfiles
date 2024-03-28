FROM aclemons/slackware:15.0@sha256:e09f4a1bac60ccd90f5b66f2ef6a9721d47bfa67f77a1b7c2dcc847adb774321

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
