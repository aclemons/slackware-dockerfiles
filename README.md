slackware-dockerfiles
=====================

Some Dockerfiles I use with Jenkins for building packages.

# Building

To build a Slackware64-14.2 full image:

    $ docker build --tag aclemons/slackware:14.2_x86_64_full --build-arg base_image=vbatts/slackware:14.2 --no-cache .

To build a Slackware64-current full image:

    $ docker build --tag aclemons/slackware:current_x86_64_full --build-arg base_image=vbatts/slackware:current --no-cache .

To build a Slackwaream-14.2 full image:

    $ # ensure you have imported the slackwarearm gpg key
    $ bash scripts/fetch_14.2_arm_files.sh
    $ docker build --tag aclemons/slackware:14.2_arm_full --file Dockerfile.arm-14.2-base --no-cache .

Note for arm support, I am using qemu-user-static-bin from slackbuilds.org to build this image from a non-arm host.
