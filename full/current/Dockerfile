FROM aclemons/slackware:current@sha256:6c77edc6651e62d5b90fdcbcf6fd7bebc35afb06db5513cf989b3e0e075689b4

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
