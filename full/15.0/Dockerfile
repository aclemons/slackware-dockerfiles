FROM aclemons/slackware:15.0@sha256:700f4e863131d9ae0d97fd2070f315504eee11f93d8256c11feb2061819c0c1f

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
