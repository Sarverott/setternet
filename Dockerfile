# version replaced for 
# some software been included 
# in system repos 
FROM alpine:3.22.2

# software apk add --no-cacheation BEGIN

RUN mkdir /__WORKSHOP 
RUN mkdir /__WORKSHOP/forge 
RUN mkdir /__WORKSHOP/archive 
RUN mkdir /__WORKSHOP/devarmory 
RUN mkdir /__WORKSHOP/craftbook

COPY ./apps/install-script.sh /__WORKSHOP/devarmory/install.sh

WORKDIR /__WORKSHOP

RUN sh devarmory/install.sh

# rc-update add ovs-modules
# rc-update add ovsdb-server
# rc-update add ovs-vswitchd
# rc-service ovs-modules start
# rc-service ovsdb-server start
# rc-service ovs-vswitchd start
# software apk add --no-cacheation END

# copy file for test purposes
COPY ./config/traefik.yml /etc/traefik/traefik.yml
COPY ./config/dnsmasq.conf /etc/dnsmasq.conf


ENTRYPOINT ["ash", "-c"]