#!/bin/sh
docker kill freerad
docker container prune -f
docker build -t mtis/freeradius:latest .
docker run -it -d -p 1812-1813:1812-1813/udp -p 1645-1646:1645-1646/udp --name freerad mtis/freeradius
docker logs freerad -f