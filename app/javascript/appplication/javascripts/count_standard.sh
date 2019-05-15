#!/usr/bin/env sh
for FILE in *.js
do
	echo -n "${FILE}: "
	standard ${FILE} 2>/dev/null | wc -l
done
