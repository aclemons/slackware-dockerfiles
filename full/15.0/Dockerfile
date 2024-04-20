FROM aclemons/slackware:15.0@sha256:68ffb5d5ee2973c4dd171575b722013e18dbac8daa5b0da8b058dc26ed1fd1a9

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
