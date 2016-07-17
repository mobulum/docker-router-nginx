#!/bin/bash

set -eo pipefail

# Replace variables in the config file

replace_vars() {
  OUTPUT=$(echo $1 | sed -e 's/.source//');
  SOURCE=$1

  eval "cat <<EOF
  $(<$SOURCE)
EOF
  " > $OUTPUT
}

if [ -e "/etc/nginx/conf.d/default.conf.source" ]
then
  replace_vars "/etc/nginx/conf.d/default.conf.source"
  rm -f "/etc/nginx/conf.d/default.conf.source"
fi

echo "Configuration settings"
cat "/etc/nginx/conf.d/default.conf"

# Start the Nginx service using the generated config
echo "[nginx] starting nginx service..."
