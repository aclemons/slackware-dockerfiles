FROM aclemons/slackware:current@sha256:e1478c731fc73ef5ad8768b88eba38fd465fd8511bc2fcd1d4745f06f4c98d58

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
