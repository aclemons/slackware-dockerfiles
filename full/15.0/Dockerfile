FROM aclemons/slackware:15.0@sha256:d214da3f92ba03cc95200c7ed11ae54dc298ff448ef66f323594717d579564ce

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
