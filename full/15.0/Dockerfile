FROM aclemons/slackware:15.0@sha256:b78d4044c293c4c23ab2bab25536dd23f896a09ec9f1dcf5629e97d22290a60c

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
