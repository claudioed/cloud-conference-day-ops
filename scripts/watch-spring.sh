#!/bin/bash

while true; do
	curl http://cloud-conference-day-spring.cloud.127.0.0.1.nip.io/api/message
	printf "\n"
	sleep 0.2
done
