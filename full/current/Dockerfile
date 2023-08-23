FROM aclemons/slackware:current@sha256:6366087d9c70e1070240a391678137e60aa88db8667d9f0962bbc56a725a19b6

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
