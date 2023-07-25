FROM aclemons/slackware:15.0@sha256:448687f0b02d826007f4538a227437e29d253386d0cb6215716ac7a4061b4e7f

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
