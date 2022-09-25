# Unofficial Slackware Linux Docker Images

# Quick reference

- **Maintained by**:

  [aclemons](https://github.com/aclemons)

# Supported tags and respective `Dockerfile` links

- [`latest`, `15.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-15.0/Dockerfile)
- [`14.2`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-14.2/Dockerfile)
- [`14.1`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-14.1/Dockerfile)
- [`14.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-14.0/Dockerfile)
- [`13.37`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-13.37/Dockerfile)
- [`13.1`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-13.1/Dockerfile)
- [`13.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-13.0/Dockerfile)
- [`12.2`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-12.2/Dockerfile)
- [`12.1`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-12.1/Dockerfile)
- [`12.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-12.0/Dockerfile)
- [`11.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-11.0/Dockerfile)
- [`10.2`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-10.2/Dockerfile)
- [`10.1`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-10.1/Dockerfile)
- [`10.0`](https://github.com/aclemons/slackware-dockerfiles/blob/master/slackware-10.0/Dockerfile)

# Quick reference (cont.)

- **Where to file issues**:
  [https://github.com/aclemons/slackware-dockerfiles/issues](https://github.com/aclemons/slackware-dockerfiles/issues)

- Supported architectures:
  amd64, armv4, armv5, armv7, arm64v8, i386 (varies per Slackware release)

# What is Slackware?

The Official Release of Slackware Linux by Patrick Volkerding is an advanced Linux operating system, designed with the twin goals of ease of use and stability as top priorities. Including the latest popular software while retaining a sense of tradition, providing simplicity and ease of use alongside flexibility and power, Slackware brings the best of all worlds to the table.

> [wikipedia.org/wiki/Slackware](https://en.wikipedia.org/wiki/Slackware)

![logo](http://www.slackware.com/~msimons/slackware/grfx/shared/bluepiSW.jpg)

# About this image

The `aclemons/slackware:latest` tag will always point to the latest stable release. Stable releases are tagged with their version (ie, `aclemons/slackware:14.2` for the prior stable release).

The current tag (`aclemons/slackware:current`) follows the current tree and should be updated within 24 hours of updates being published to the ChangeLog.

These images are intended to serve the following goals:

- Demonstrate how Slackware works through a docker image
- Provide a solid base image upon which to base others
- slackpkg needs to work out of the box
- Packages have not been modified after installation (other than configuring slackpkg)

## Acknowledgements

These images are based on the hard work done by vbatts in his [slackware-container](https://github.com/vbatts/slackware-container) repo.

## How It's Made

The images published here are built using a github action using vbatts work as a base, but extended to build multi-arch images and to not minimise the image, allowing other images to extend without having to re-install packages. Vincent's scripts produce an image similar to the debian -slim images, where the man pages and other not strictly necessary files are removed to minimise the images as much as possible.

The scripts used for this can be found in the [github repository](https://github.com/aclemons/slackware-dockerfiles).

# License

The Docker image creation scripts contained under the repository slackware-dockerfiles are licensed under the MIT license.

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.
