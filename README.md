slackware-dockerfiles
=====================

Some Dockerfiles I use with Jenkins for building packages.

# Building

To build a Slackware64-14.2 full image:

    $ bash scripts/sync_local_mirror.sh slackware64-14.2
    $ docker build --tag aclemons/slackware:14.2_x86_64_full --build-arg base_image=vbatts/slackware:14.2 --build-arg local_mirror=local_mirrors/slackware64-14.2 --no-cache .

To build a Slackware64-current full image:

    $ bash scripts/sync_local_mirror.sh slackware64-current
    $ docker build --tag aclemons/slackware:current_x86_64_full --build-arg base_image=vbatts/slackware:current --build-arg local_mirror=local_mirrors/slackware64-current --no-cache .

To build a Slackwaream-14.2 full image:

    $ # ensure you have imported the slackwarearm gpg key
    $ bash scripts/fetch_14.2_arm_files.sh
    $ docker build --tag aclemons/slackware:14.2_arm_base --file Dockerfile.arm-14.2-base --no-cache .
    $ bash scripts/sync_local_mirror.sh slackwarearm-current
    $ docker build --tag aclemons/slackware:14.2_arm_full --build-arg base_image=aclemons/slackware:14.2_arm_base --build-arg local_mirror=local_mirrors/slackwarearm-current --no-cache .

To build a Slackwaream-current full image:

    $ # ensure you have imported the slackwarearm gpg key
    $ bash scripts/fetch_current_arm_files.sh
    $ docker build --tag aclemons/slackware:current_arm_base --file Dockerfile.arm-current-base --no-cache .
    $ bash scripts/sync_local_mirror.sh slackwarearm-14.2
    $ docker build --tag aclemons/slackware:current_arm_full --build-arg base_image=aclemons/slackware:current_arm_base --build-arg local_mirror=local_mirrors/slackwarearm-14.2 --no-cache .

Note for arm support, I am using qemu-user-static-bin from slackbuilds.org to build this image from a non-arm host.
