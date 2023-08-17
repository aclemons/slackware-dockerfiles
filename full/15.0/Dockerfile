FROM aclemons/slackware:15.0@sha256:287cad35c44be6bd90855dd056b1e2da78a748716b20f9c0ea75c0bb3ecf4179

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
