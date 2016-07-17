FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.source /etc/nginx/conf.d/default.conf.source
COPY bin/source.sh /etc/nginx/source.sh
RUN chmod +x /etc/nginx/source.sh

ENV LB_HOST_01_TCP_ADDR 172.17.0.1
ENV LB_HOST_01_TCP_PORT 9510

ENV LB_HOST_02_TCP_ADDR 172.17.0.1
ENV LB_HOST_02_TCP_PORT 9511

ENV LB_HOST_03_TCP_ADDR 172.17.0.1
ENV LB_HOST_03_TCP_PORT 9512

ENV LB_HOST_TCP_PORT 9500

EXPOSE 9510 9511 9512 9500