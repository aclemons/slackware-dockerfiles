FROM aclemons/slackware:15.0@sha256:a2e785ffcd6fc2d9a8c58923e89a51c1c857cf013fad5fe0732b6cd628bef1df

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
