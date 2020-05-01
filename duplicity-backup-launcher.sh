#! /bin/bash

set -e

TYPE="${1:-daily}"

DUBCK="/usr/local/sbin/duplicity-backup"
[ -x "$DUBCK" ] || exit 0

for conf in $(find /etc/duplicity/$TYPE -maxdepth 1 -name \*.conf) ; do
	conf=$(readlink -f $conf)
	echo "=========================="
	echo "backup with $conf"
	$DUBCK --config "$conf" --backup
	echo "=========================="
	echo ""
done

exit 0
