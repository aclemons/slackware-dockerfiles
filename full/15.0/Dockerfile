FROM aclemons/slackware:15.0@sha256:2b43851d0815f6dd58501b91a3469115f6f3b477dd95a11e0f2711e5a13ec370

COPY scripts/install_all.sh /

ARG mirror_base
RUN ./install_all.sh "$mirror_base" && rm /install_all.sh
