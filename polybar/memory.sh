echo " " $(free -h | awk '/^Mem:/ {print $3}' | sed 's/Gi/G/')
