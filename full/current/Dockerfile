FROM aclemons/slackware:current@sha256:871c95414917cd7ffcaf04d9ac506e7eec79c36da5c42b056e13a05fa5163195

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
