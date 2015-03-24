#!/bin/bash

PID_FILE="application.pid"

# let's see if a pid file exists..
if [ -e "$PID_FILE" ]; then
  # so we have a pid file here
  PID=$(<"$PID_FILE")
  # is there still a process running?
  ps -p $PID >/dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "there is aready an application running - can't start a new one"
    exit 1
  else
    echo "found a stale pid - cleaning up now.."
    rm $PID_FILE
  fi
fi

echo "starting application.."
nohup /usr/bin/java -jar ../build/libs/spring-boot-service-0.0.1-SNAPSHOT.jar > application.out &
