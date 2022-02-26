slackware-dockerfiles
=====================

Some Dockerfiles I use with Jenkins for building packages.

# Building

To build a Slackware64-14.2 full image:

    $ bash scripts/sync_local_mirror.sh slackware64-14.2
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware64-14.2:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:14.2_x86_64_full --build-arg base_image=vbatts/slackware:14.2 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware64-current full image:

    $ bash scripts/sync_local_mirror.sh slackware64-current
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware64-current:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:current_x86_64_full --build-arg base_image=vbatts/slackware:current --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackwaream-14.2 full image:

    $ docker build --tag aclemons/slackware:14.2-arm-base --file slackwarearm-14.2/Dockerfile --no-cache .
    $ bash scripts/sync_local_mirror.sh slackwarearm-14.2
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackwarearm-14.2:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:14.2-arm-full --build-arg base_image=aclemons/slackware:14.2-arm-base --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackwaream-current full image:

    $ docker build --tag aclemons/slackware:current-arm-base --file slackwarearm-current/Dockerfile --no-cache .
    $ bash scripts/sync_local_mirror.sh slackwarearm-current
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackwarearm-current:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:current-arm-full --build-arg base_image=aclemons/slackware:current-arm-base --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

Note for arm support, I am using qemu-user-static-bin from slackbuilds.org to build this image from a non-arm host.
