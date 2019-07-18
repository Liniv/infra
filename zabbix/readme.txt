#RUN
docker stack deploy --compose-file=zabbix-stack.yaml zabbix
#Remove
docker stack rm zabbix
