FROM centos:latest
RUN yum install -y epel-release && yum install -y nfdump && yum install net-tools -y && yum install crontabs -y
RUN mkdir /mtmp \
	&& chmod 777 -R /mtmp
COPY cron/set_netflow.sh /mtmp
COPY cron/crontab /mtmp
RUN cd /mtmp \
	&& cp crontab /etc/crontab \
	&& cp set_netflow.sh /root/set_netflow.sh
RUN mkdir /data
CMD ["nfcapd", "-w", "-p", "9996", "-I", "any", "-l", "/data", "-4", "-S", "1", "-t", "60", "-B", "512000", "-z"]


