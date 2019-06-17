ARG base_image=vbatts/slackware:14.2
FROM $base_image

ARG base_image
RUN echo "Using base image $base_image"
RUN if [ "$base_image" = "vbatts/slackware:current" ] || [ "$base_image" = "aclemons/slackware:current_arm_base" ] ; then touch /var/lib/slackpkg/current ; fi
RUN sed -i 's/^\(WGETFLAGS="\)\(.*\)$/\1--quiet \2/' /etc/slackpkg/slackpkg.conf
RUN slackpkg -default_answer=yes -batch=on update
RUN slackpkg -default_answer=yes -batch=on upgrade slackpkg
RUN slackpkg -default_answer=yes -batch=on update
RUN if [ "$base_image" = "vbatts/slackware:current" ] ; then slackpkg -default_answer=yes -batch=on install pcre2 libpsl ; fi
RUN slackpkg -default_answer=yes -batch=on upgrade-all
RUN slackpkg -default_answer=yes -batch=on install a/* ap/* d/* e/* f/* k/* kde/* l/* n/* t/* tcl/* x/* xap/* xfce/* y/*
RUN slackpkg -default_answer=yes -batch=on install-new
RUN slackpkg -default_answer=yes -batch=on upgrade-all
RUN slackpkg -default_answer=yes -batch=on clean-system
RUN slackpkg -default_answer=yes -batch=on install rust
RUN slackpkg -default_answer=yes -batch=on new-config
