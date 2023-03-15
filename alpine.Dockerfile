FROM alpine:3.17
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ARG VERSION=1.26.0
RUN apk update && apk add --no-cache curl net-snmp net-snmp-tools ipmitool ca-certificates && update-ca-certificates 
ENV TELEGRAF_CONFIG_PATH /etc/telegraf/telegraf.conf
RUN curl https://dl.influxdata.com/telegraf/releases/telegraf-${VERSION}_linux_amd64.tar.gz | tar xvz -C / --strip 2 ./telegraf-${VERSION}/usr/bin/telegraf ./telegraf-${VERSION}/etc/telegraf/
COPY mibs /usr/share/snmp/mibs
CMD ["/usr/bin/telegraf"]
