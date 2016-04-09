FROM gentoo/stage3-amd64

# Optimize for cache
COPY cleanup.sh /cleanup.sh

# Updated package to recommended version, install necessary software for debug..
RUN emerge --sync --quiet && \
  emerge --update --newuse --deep @world && \
  emerge --quiet net-analyzer/netcat net-misc/curl app-portage/gentoolkit

# Post installation config: locale, revdep, clean
RUN eselect locale set en_US.utf8 && \
  source /etc/profile && \
  revdep-rebuild -v && \
  eclean -d distfiles && eclean -d packages && \
  /cleanup.sh && rm -rf /cleanup.sh
