slackware-dockerfiles
=====================

Some Dockerfiles I use with Jenkins for building packages.

# Building

To build a Slackware-14.2 full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware -e ARCH=i586 -e VERSION=14.2 -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/386 -t aclemons/slackware:14.2-base-386 -f slackware-14.2/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware-14.2
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware-14.2:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:14.2-x86-full --build-arg base_image=aclemons/slackware:14.2-base-386 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware-15.0 full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware -e ARCH=i586 -e VERSION=15.0 -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/386 -t aclemons/slackware:15.0-base-386 -f slackware-15.0/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware-15.0
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware-15.0:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:15.0-x86-full --build-arg base_image=aclemons/slackware:15.0-base-386 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware-current full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware -e ARCH=i586 -e VERSION=current -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/386 -t aclemons/slackware:current-base-386 -f slackware-current/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware-current
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware-current:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:current-x86-full --build-arg base_image=aclemons/slackware:current-base-386 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware64-14.2 full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware64 -e ARCH=x86_64 -e VERSION=14.2 -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/amd64 -t aclemons/slackware:14.2-base-amd64 -f slackware-14.2/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware64-14.2
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware64-14.2:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:14.2-x86_64-full --build-arg base_image=aclemons/slackware:14.2-base-amd64 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware64-15.0 full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware64 -e ARCH=x86_64 -e VERSION=15.0 -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/amd64 -t aclemons/slackware:15.0-base-amd64 -f slackware-15.0/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware64-15.0
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware64-15.0:/usr/share/nginx/html:ro" -p 3000:80 --name mirror nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:15.0-x86_64-full --build-arg base_image=aclemons/slackware:15.0-base-amd64 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackware64-current full image:

    $ docker run --cap-add SYS_ADMIN --rm -e RELEASENAME=slackware64 -e ARCH=x86_64 -e VERSION=current -e CHOWN_TO="$(id -u):$(id -g)" -v "$(pwd):/data" -v "$(pwd)/scripts:/scripts" alpine:3.15 sh /scripts/build_base_image.sh
    $ docker buildx build --platform linux/amd64 -t aclemons/slackware:current-base-amd64 -f slackware-current/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackware64-current
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackware64-current:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:current-x86_64-full --build-arg base_image=aclemons/slackware:current-base-amd64 --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackwarearm-14.2 full image:

    $ curl -s -f -o slackware-14.2/slackarm-14.2-miniroot_details.txt https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt
    $ curl -s -f -o slackware-14.2/slackarm-14.2-miniroot_details.txt.asc https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-14.2-miniroot_details.txt.asc
    $ docker buildx build --platform linux/arm/v5 -t aclemons/slackware:14.2-base-arm -f slackware-14.2/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackwarearm-14.2
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackwarearm-14.2:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:14.2-arm-full --build-arg base_image=aclemons/slackware:14.2-base-arm --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackwarearm-15.0 full image:

    $ curl -s -f -o slackware-15.0/slackarm-15.0-miniroot_details.txt https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-15.0-miniroot_details.txt
    $ curl -s -f -o slackware-15.0/slackarm-15.0-miniroot_details.txt.asc https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackarm-15.0-miniroot_details.txt.asc
    $ docker buildx build --platform linux/arm/v7 -t aclemons/slackware:15.0-base-arm -f slackware-15.0/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackwarearm-15.0
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackwarearm-15.0:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:15.0-arm-full --build-arg base_image=aclemons/slackware:15.0-base-arm --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

To build a Slackwareaarch64-current full image:

    $ curl -s -f -o slackware-current/slackaarch64-current-miniroot_details.txt https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackaarch64-current-miniroot_details.txt
    $ curl -s -f -o slackware-current/slackaarch64-current-miniroot_details.txt.asc https://slackware.uk/slackwarearm/slackwarearm-devtools/minirootfs/roots/slackaarch64-current-miniroot_details.txt.asc
    $ docker buildx build --platform linux/arm64/v8 -t aclemons/slackware:current-base-arm -f slackware-current/Dockerfile --load .
    $ bash scripts/sync_local_mirror.sh slackwareaarch64-current
    $ docker run -d --rm -v "$(pwd)/local_mirrors/slackwareaarch64-current:/usr/share/nginx/html:ro" -p 3000:80 nginx:alpine
    $ docker build --network=host --tag aclemons/slackware:current-aarch64-full --build-arg base_image=aclemons/slackware:current-base-arm --build-arg mirror=http://localhost:3000 --no-cache .
    $ docker container stop mirror

Note for arm support, I am using this docker image to install the binfmt stubs for qemu:

    $ docker run --rm --privileged tonistiigi/binfmt:master --install all
