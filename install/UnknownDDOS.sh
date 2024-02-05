#!/bin/bash
export APP_INSTALL=/usr/local/UnknownDDOS
export DIR_DATABASE_IP=/usr/local/UnknownDDOS/databaseIP.json
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

UninstallUnknownDDOS(){

}

UpdateUnknownDDOS(){
  
}

RunAction(){

    case $NUMBER_ACTION in
    1) ConfigAntiDDOS ;;
    2) UninstallUnknownDDOS ;;
    3) UpdateUnknownDDOS ;;
    *) defaultAction ;;
    esac

}

StartApp() {
  welcome
  echo ""
  textRed "----------------> TOOL MANAGER"
  textGreen "0 ) Exit App.                                   1 ) Config Anti DDos."
  echo ''
  textRed "----------------> ABOUT TOOL"
  textGreen "2) Uninstall Unknown DDOS.                      3) Update Unknown DDOS."
  echo ''
  read -p "----------------> ENTER NUMBER ACTION : " NUMBER_ACTION
  echo ""
  RunAppAction
}

while [ $NUMBER_ACTION -ne 0 ]; do

  if [[ $NUMBER_ACTION -eq -1 ]]; then
    RunAppAction
    else
      RunAction
  fi

done
