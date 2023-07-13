FROM aclemons/slackware:15.0@sha256:c72e1b36c0908094bd88193e6fbfe51d048e73fe3bccc48281bc74ebdbd0447f

COPY scripts/install_all.sh /

ARG mirror_base
RUN bash /install_all.sh "$mirror_base" && rm /install_all.sh
