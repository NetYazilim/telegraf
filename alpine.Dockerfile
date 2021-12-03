FROM alpine:3.15
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ARG VERSION=1.19.3
RUN apk update && apk add --no-cache curl net-snmp net-snmp-tools ipmitool ca-certificates && update-ca-certificates 
ENV TELEGRAF_CONFIG_PATH /etc/telegraf/telegraf.conf
RUN curl https://dl.influxdata.com/telegraf/releases/telegraf-${VERSION}_static_linux_amd64.tar.gz | tar xvz -C / --strip 2 ./telegraf-${VERSION}/usr/bin/telegraf ./telegraf-${VERSION}/etc/telegraf/
COPY mibs /usr/share/snmp/mibs
CMD ["/usr/bin/telegraf"]
