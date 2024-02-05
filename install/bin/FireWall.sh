isSearchEngine(){
  verifyEngine=0;
  if [[ $1 == *"google"* ]]; then
    verifyEngine=1;
  fi
  echo $verifyEngine;
}

BlockFireWall(){
while read line; do sudo ufw deny from $line; done < APP_INSTALL/IPBlock.txt
}

NginxIPAccess(){
  IPNginx=$(sudo awk '{print $1}' $LOG_NGINX/_access.log)
  echo $IPNginx;
}
VerifyBadIP(){
  isBad=1;
  isSearch=$(isSearchEngine $1);
  if [[ isSearch -eq 1 ]]; then
    isBad=0;
  fi
  country=$(strPos $1 "Vietnam");

  if [[ country -ne -1 ]]; then
    isBad=0;
  fi
  echo $isBad;
}

addBadIP(){
  echo $1 >> APP_INSTALL/IPBlock.txt
}

InFileIPBlock(){
  Response=0;
    isInFile=$(cat $APP_INSTALL | grep -c "$1");
    if [ $isInFile -eq 0 ]; then
       Response=0
    else
      Response=1
    fi
    echo $Response;
}
