#!/bin/bash
export APP_INSTALL=/usr/local/UnknownAD
export LOG_NGINX=/var/log/nginx
source $APP_INSTALL/Loader.sh
killApt

case $1 in
    1) configAntiDdos;;
    2) enableUFW;;
    3) statusUFW;;
    4) runAntiDDos;;
    5) SetAllowIP;;
     6) UpdateFireWall;;
    7) uninstallUnknownAD;;
    8) UpdateUnknownAD;;
esac
