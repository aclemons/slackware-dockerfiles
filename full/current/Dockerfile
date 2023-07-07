FROM aclemons/slackware:current@sha256:f79cdfa9db62b8fcb00cb39de818f1b2b053acdf7d9df288b560cc20f89fc381

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
