isSearchEngine(){
  verifyEngine=0;
  if [[ $1 == *"google"* ]]; then
    verifyEngine=1;
  fi
  echo $verifyEngine;
}

BlockFireWall(){
while read line; do sudo ufw deny from $line &> /dev/null; done < $APP_INSTALL/rule/IPBad.txt
}

AllowIPFireWall(){
  while read line; do sudo ufw delete deny from $line  &> /dev/null; done < $APP_INSTALL/rule/IPGood.txt
}

VerifyBadIP(){

  isBad=0;

  getInfo=$(getInfoIP $1);

  if [[ -n $getInfo ]]; then

    country=$(strPos $getInfo $ALLOW_COUNTRY);

      if [[ $country -eq -1 ]]; then
        isBad=$((isBad + 1));
      fi

      idBadASN=0;

      if [[ $(strLength "$ALLOW_ASN") -gt 3 ]]; then

          for item in $ALLOW_ASN ; do
            tmp=$(strPos $getInfo "AS$item");

             if [[ $tmp -ne -1 ]]; then
                idBadASN=$((idBadASN + 1));
              fi
          done
      fi

      if [[ $idBadASN -ne 0 ]]; then
        isBad=0;
      fi

      isSearch=$(isSearchEngine $getInfo);
      if [[ $isSearch -eq 1 ]]; then
          isBad=0;
      fi



    else
      isBad=1;

  fi


  echo $isBad;
}

addBadIP(){
  echo $1 >> $APP_INSTALL/rule/IPBad.txt
}

InFileIPBlock(){
  Response=0;
    isInFile=$(cat $APP_INSTALL/rule/IPBad.txt | grep -c "$1");
    if [ $isInFile -eq 0 ]; then
       Response=0
    else
      Response=1
    fi
    echo $Response;
}
