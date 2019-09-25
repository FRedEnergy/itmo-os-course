#!/bin/bash

time=$(TZ="Europe/Moscow" date | awk '{print $2 "_" $3 "_" $4}')

mkdir ~/test && {
	echo "catalog test was created successfully" > ~/report
   	touch ~/test/$time
}
ping "www.net_nikogo.ru" || echo "host is not available" >> ~/report

