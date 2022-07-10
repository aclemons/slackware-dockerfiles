ARG base_image=aclemons/slackware:14.2-x84_64-full
# hadolint ignore=DL3006
FROM $base_image

COPY slackpkgplus/slackpkg+-1.8.0-noarch-6mt.txz /
COPY scripts/install_template.sh /
COPY templates/ /etc/slackpkg/templates/

ARG post_install=script/empty_post_install.sh
COPY "$post_install" /post_install.sh

RUN bash upgradepkg --install-new slackpkg+-1.8.0-noarch-6mt.txz

ARG base_image=aclemons/slackware:14.2-x84_64-full
ARG mirror
ARG template

RUN bash /install_template.sh "$base_image" "$mirror" "$template" && rm /install_template.sh
