FROM scratch

ADD slackarm-current-miniroot_22Dec21.tar.xz /
COPY qemu-arm-static /usr/bin
RUN sed -i 's/^\(ftp:\)/#\1/' /etc/slackpkg/mirrors
RUN echo "https://slackware.uk/slackwarearm/slackwarearm-current/" >> /etc/slackpkg/mirrors
RUN echo "# file://path/to/some/directory/" >> /etc/slackpkg/mirrors
RUN sed -i 's/DIALOG=on/DIALOG=off/' /etc/slackpkg/slackpkg.conf
RUN sed -i 's/POSTINST=on/POSTINST=off/' /etc/slackpkg/slackpkg.conf
RUN sed -i 's/SPINNING=on/SPINNING=off/' /etc/slackpkg/slackpkg.conf
COPY diffutils-3.8-arm-1.txz /tmp/
RUN upgradepkg --install-new /tmp/*.txz
RUN rm /tmp/*.txz #!COMMIT
