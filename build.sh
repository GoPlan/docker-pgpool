#!/bin/sh
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
docker build -t goplan/pgpool-2:latest -t goplan/pgpool-2:postgres9.6 ${SCRIPTPATH}