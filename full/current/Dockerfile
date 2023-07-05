FROM aclemons/slackware:current@sha256:e3b398d6e2fad2dc39b24f8bd3316f9b08b2c2f8c6e1f6222641b797d4c68688

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
