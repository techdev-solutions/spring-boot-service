#!/bin/bash

PID_FILE="application.pid"

# let's see if a pid file exists..
if [ ! -e "$PID_FILE" ]; then
  echo "$PID_FILE not found - is the application running?"
else
  # pid file found, now reading the pid
  PID=$(<"$PID_FILE")
  # is there a process running with the given pid?
  ps -p $PID >/dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "found running application with pid $PID - attempting to stop it now.."
    kill $PID
  else
    echo "found a pid file with pid $PID but there is no such process - cleaning up now.."
    rm $PID_FILE
  fi
fi
