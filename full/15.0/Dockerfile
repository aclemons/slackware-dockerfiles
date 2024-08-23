FROM aclemons/slackware:15.0@sha256:6824b92667d0a3f05fc73a312c51571493243a667e3eadeaa53a8e9e05c283d2

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
