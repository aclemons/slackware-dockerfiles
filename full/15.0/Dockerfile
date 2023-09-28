FROM aclemons/slackware:15.0@sha256:ddc85fca4fcd0a9db191ca46b55f80f6df945938018f1ec526166205b2668f23

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
