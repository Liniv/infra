#!/bin/sh
docker kill freerad
docker rm freerad
docker build -t mtis/freeradius:latest .
docker run -it -d -p 67:67/udp -p 1700:1700/udp -p 1812-1813:1812-1813/udp --name freerad mtis/freeradius
#docker exec -it freerad bash
