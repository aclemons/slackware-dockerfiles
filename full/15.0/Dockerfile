FROM aclemons/slackware:15.0@sha256:0e384f40c79e559b7f7d6ac62ac3d163919296e2905b34f236fedc730897934b

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
