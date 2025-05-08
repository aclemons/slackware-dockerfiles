FROM aclemons/slackware:15.0@sha256:113bbaa010c2658e7ed8355ec2f666c1265c724c15910f9650c9e0108c973411

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
