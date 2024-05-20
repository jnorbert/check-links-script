#!/bin/bash

# URL to check
URL="http://example.com"

# Report file
REPORT_FILE="link_check_report.txt"

# Checking the validity of links
check_links() {
  echo "Link Validity Report - $(date)" > $REPORT_FILE
  echo "--------------------------------" >> $REPORT_FILE
  
  LINKS=$(curl -s $URL | sed -n 's/.*href="\([^"]*\).*/\1/p')
  for link in $LINKS; do
    # Check if the link is absolute or relative
    if [[ $link != http* ]]; then
      # If the link is relative, add the base URL
      link="$URL$link"
    fi
    HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" -L $link)
    if [ "$HTTP_STATUS" -eq 200 ]; then
      echo "$link is valid." >> $REPORT_FILE
    else
      echo "$link is invalid (HTTP status: $HTTP_STATUS)." >> $REPORT_FILE
    fi
  done
  
  echo "The report has been saved to $REPORT_FILE."
}

check_links
