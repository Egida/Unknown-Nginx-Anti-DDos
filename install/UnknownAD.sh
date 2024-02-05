#!/bin/bash
export APP_INSTALL=/usr/local/UnknownAD
export LOG_NGINX=/var/log/nginx
source $APP_INSTALL/loader.sh
NUMBER_ACTION=-1

welcome(){

echo ""
textRed "##############################################################################"
textRed "#                                                                            #"
textRed "#                                                                            #"
textRed "#                     Welcome to UNKNOWN ANTI DDOS                           #"
textRed "#                                                                            #"
textRed "#                     Copyright (C)  2024 UNKNOWN.                           #"
textRed "#                          VERSION 1.0.2.1                                   #"
textRed "#                                                                            #"
textRed "##############################################################################"
echo "";

}

defaultAction() {
  NUMBER_ACTION=-1
  textRed "----------------> PLEASE CHECK AGAIN"
  echo ''
}



RunAction(){

    case $NUMBER_ACTION in
    1) configAntiDdos ;;
    2) enableUFW ;;
    3) runAntiDDos ;;
    4) uninstallUnknownAD ;;
    5) UpdateUnknownAD ;;
    *) defaultAction ;;
    esac

}

StartApp() {
  welcome
  echo ""
  textRed "----------------> TOOL MANAGER"
  textGreen "0 ) Exit App.                                   1 ) Config Anti DDos."
  textGreen "2 ) Enable FireWall.                            3 ) Run Anti DDos."
  echo ''
  textRed "----------------> ABOUT TOOL"
  textGreen "4 ) Uninstall Unknown DDOS.                     5 ) Update Unknown DDOS."
  echo ''
  read -p "----------------> ENTER NUMBER ACTION : " NUMBER_ACTION
  echo ""

  if [[ -z $NUMBER_ACTION ]]; then
    NUMBER_ACTION=-1;
  fi
}

killApt

while [ $NUMBER_ACTION -ne 0 ]; do
 # clear;
  if [[ $NUMBER_ACTION -eq -1 ]]; then
    StartApp
    else
      RunAction;
      exit;
  fi

done
