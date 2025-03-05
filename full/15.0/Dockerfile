FROM aclemons/slackware:15.0@sha256:765f11056b677b5835eb86a9653289815d22cc66ac348ab6b754be95872ca3ca

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
