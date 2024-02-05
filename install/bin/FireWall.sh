isSearchEngine(){
  verifyEngine=0;
  if [[ $1 == *"google"* ]]; then
    verifyEngine=1;
  fi
  echo $verifyEngine;
}

BlockFireWall(){
while read line; do sudo ufw deny from $line; done < $APP_INSTALL/IPBlock.txt
}

RemoveFireWall(){
  while read line; do sudo ufw delete deny from $line; done < $APP_INSTALL/IPWhile.txt
}

NginxIPAccess(){
  IPNginx=$(sudo awk '{print $1}' $LOG_NGINX/_access.log)
  echo $IPNginx;
}

VerifyBadIP(){
  isBad=0;

  country=$(strPos $1 $ALLOW_COUNTRY);

  if [[ $country -ne -1 ]]; then
    isBad=$((isBad + 1));
  fi

  idBadASN=0;

  if [[ $(strLenth $ALLOW_ASN) -gt 3 ]]; then

      for item in $ALLOW_ASN ; do
        tmp=$(strPos $1 "AS$item");

         if [[ $tmp -ne -1 ]]; then
            idBadASN=$((idBadASN + 1));
          fi
      done
  fi

  if [[ $idBadASN -ne 0 ]]; then
    isBad=0;
  fi


  isSearch=$(isSearchEngine $1);
  if [[ $isSearch -eq 1 ]]; then
      isBad=$((isBad + 1));
  fi

  echo $isBad;
}

addBadIP(){
  echo $1 >> $APP_INSTALL/IPBlock.txt
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
