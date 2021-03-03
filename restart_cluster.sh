#!/bin/bash

SERVER_PREFIX=mariadb_node

$(which docker-compose) stop

for i in {01..03};
do
  $(which docker-compose) rm -f $SERVER_PREFIX$i
done

echo "Remember to set BOOTSTRAP=1 environment variable to one of the nodes"