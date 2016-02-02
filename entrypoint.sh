#!/bin/bash
/opt/symform/SymformNode.sh service contrib 2> /dev/null &
/opt/symform/SymformNode.sh service sync 2> /dev/null &
/opt/symform/SymformNode.sh service web 2> /dev/null &

symform_pid () {
  PID=$(ps aux | egrep "symform(sync|web|contrib)" | grep -v exe| awk '{ print $2 }')
  if [[ $(echo $PID | wc -w) -eq "3"  ]]; then
    return 0
  else
    return 1
  fi
}

symform_pid
echo "================"
echo "Container written by Joshi Friberg"
echo "Symform is running with pids $PID"
echo "Start time was: $(date)"
while symform_pid; do
  sleep 60
  echo -ne "Still running:  $(date)\r"
done
