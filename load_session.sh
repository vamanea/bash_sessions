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

if [ -f "mkdir -p $SESSION_FOLDER" ]; then
	echo "Session does not exist!"
	exit 2
fi


history -c
history -r $HISTORY_FILE

eval $(cat $ENV_FILE | sed 's/^\(.*\)/export \"\0\"/')
# Spawn new shell with the environment
bash
