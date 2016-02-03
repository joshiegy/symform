#!/bin/bash
/opt/symform/SymformNode.sh service contrib 2> /dev/null &
/opt/symform/SymformNode.sh service sync 2> /dev/null &
/opt/symform/SymformNode.sh service web 2> /dev/null &
C="0"

symform_pid () {
  PID=$(ps aux | egrep -i "symform(sync|web|contrib)" | grep -v exe| awk '{ print $2 }')
  if [[ $(echo $PID | wc -w) -gt 2  ]]; then
    return 0
  else
    return 1
  fi
}

until symform_pid; do
  if [[ $C -eq "0" ]]; then
    echo -ne "Waiting for Symform to start..\r"
    C="1"
  else
    echo -ne "Waiting for Symform to start. \r"
    C="0"
  fi
  sleep 1
done

echo "================                         "
echo "Container written by Joshi Friberg"
echo "Symform is running with pids $(echo $PID)"
echo "Start time was: $(date)"
while symform_pid; do
  sleep 60
  echo -ne "Still running:  $(date)\r"
done
