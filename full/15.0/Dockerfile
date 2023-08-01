FROM aclemons/slackware:15.0@sha256:6449293d7d90be75d38f4d493ccaae8a1c92ac13295d9c4285113d9f469c964d

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
