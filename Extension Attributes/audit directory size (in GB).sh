  #!/bin/bash
# While configuring auditing for CIS requirements, found that some audit logs were not 
# purging or rolling over correctly and growing very large. This EA script was created to 
# watch that directory so that the directory could be cleared or rotated via a 
# another script, triggered by a smart group

dirSize=$(du -g /var/audit | awk '{print $1}')

echo "<result>$dirSize</result>"

exit 0
