FROM aclemons/slackware:15.0@sha256:5118d4791586ee84a20eab9231d45adc831e0d4fae6dfaae945e5ba5931702f5

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
