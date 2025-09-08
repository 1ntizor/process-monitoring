#!/bin/bash


LOG_FILE="/var/log/monitoring.log"
PROCESS_NAME="test"
URL="https://test.com/monitoring/test/api"


log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> $LOG_FILE
}


if pgrep -x "$PROCESS_NAME" > /dev/null; then

    if curl -s -k --connect-timeout 5 "$URL" > /dev/null; then

        exit 0
    else

        log "ERROR: Monitoring server $URL is not accessible"
        exit 1
    fi
else

    exit 0
fi
