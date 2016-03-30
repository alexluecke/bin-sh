#! /bin/bash

YESTERDAY=$(date --date='-1 day' +'%F %T')
TODAY_MINUS_30=$(date --date='-300 day' +'%F %T')


# Delete all but the first instance in the range -- should leave one back-up
# per month.
FILES=$(find *.ext -maxdepth 1 -type f -newermt "$TODAY_MINUS_30" \
		! -newermt "$YESTERDAY" \
		| tail -n +2)

# # If files were found, delete them.
# if [ -n "$FILES" ]; then
# 	echo "$FILES" | xargs rm
# fi

echo "$FILES"
