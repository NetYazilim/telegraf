FROM alpine:3.19 as builder
ARG VERSION=1.26.0
RUN apk update && apk add --no-cache curl ca-certificates && update-ca-certificates 
RUN curl https://dl.influxdata.com/telegraf/releases/telegraf-${VERSION}_linux_amd64.tar.gz | tar xvz -C / --strip 2 ./telegraf-${VERSION}/usr/bin/telegraf ./telegraf-${VERSION}/etc/telegraf/

FROM scratch
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ENV TELEGRAF_CONFIG_PATH /etc/telegraf/telegraf.conf
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=builder /etc/telegraf /etc/telegraf
COPY --from=builder /usr/bin/telegraf /usr/bin/telegraf 
ENTRYPOINT ["/usr/bin/telegraf"]
