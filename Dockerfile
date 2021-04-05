FROM ruby:2.6.5


# Add global dependencies
RUN apt-get update \
    && apt-get install -y apt-transport-https ca-certificates imagemagick libmagickwand-dev libfontconfig rsync

RUN apt-get update \
    && apt-get install -y openssh-client libpq-dev postgresql-client

RUN \
    curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get update && \
    apt-get install -y --force-yes --no-install-recommends nodejs


# Slim down image
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man/?? /usr/share/man/??_*

