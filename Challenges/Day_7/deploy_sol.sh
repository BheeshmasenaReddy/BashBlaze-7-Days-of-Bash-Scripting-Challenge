#!/bin/bash

num_of_containers=1
for (( i=0; i<$num_of_containers; i+=1 ));
    do docker run —name docker-nginx$i -P -d nginx
    sleep 3
done