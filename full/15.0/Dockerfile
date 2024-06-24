FROM aclemons/slackware:15.0@sha256:3278d1e37a20adeececb59dd1daf06eec1fa0ac6b76a04190b80ffe972b174fd

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
