#!/bin/bash -i

SESSIONS_FOLDER="$HOME/.sessions"
SESSION_NAME=$1

if [ -z "$SESSION_NAME" ]; then
	echo "Must supply a session name!"
	exit 1
fi

SESSION_FOLDER=${SESSIONS_FOLDER}/${SESSION_NAME}
ENV_FILE=${SESSION_FOLDER}/${SESSION_NAME}.env
HISTORY_FILE=${SESSION_FOLDER}/${SESSION_NAME}.hist
mkdir -p $SESSION_FOLDER

env > $ENV_FILE
history -w $HISTORY_FILE
