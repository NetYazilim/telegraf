FROM alpine:3.18 
### ipmitool 3.18 de çalışmıyor
LABEL maintainer "Levent SAGIROGLU <LSagiroglu@gmail.com>"
ARG VERSION=1.26.0
add mibs /usr/share/snmp/mibs

