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
backToMainScreen() {
  NUMBER_ACTION=-1
  echo ''
}

RunAction(){

    case $NUMBER_ACTION in
    1) configAntiDdos
      backToMainScreen;;
    2) enableUFW
      backToMainScreen;;
    3) statusUFW
      backToMainScreen;;
    4) runAntiDDos
      backToMainScreen;;
    5) uninstallUnknownAD
      backToMainScreen;;
    6) UpdateUnknownAD
      backToMainScreen;;
    *) defaultAction ;;
    esac

}

StartApp() {
  welcome
  echo ""
  textRed "----------------> TOOL MANAGER"
  textGreen "0 ) Exit App.                                   1 ) Config Anti DDos."
  textGreen "2 ) Enable FireWall.                            3 ) Status FireWall."
  textGreen "4 ) Run Anti DDos"
  echo ''
  textRed "----------------> ABOUT TOOL"
  textGreen "5 ) Uninstall Unknown DDOS.                     6 ) Update Unknown DDOS."
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
  fi

done
