runAntiDDos(){
  textGreen "----------------> SCAN IP ANTI DDOS";
  getIP=$(NginxIPAccess);
  if [[ $(strLength "$getIP") -gt 3 ]]; then
    for i in $getIP ; do
      if [[ $(InFileIPBlock $i) -eq 0 ]]; then
        isBad=$(VerifyBadIP $i);
        if [[ $isBad -ne 0 ]]; then
          addBadIP "$i";
          echo "IP BAD $i"
        fi
      fi
    done
  UpdateFireWall;
  fi
}

SetAllowIP(){
  textGreen "----------------> SET ALLOW IP";
  sudo nano $APP_INSTALL/rule/IPGood.txt;
  textMagenta "----------------> CONFIG SUCCESS"
}
UpdateFireWall(){
  textGreen "----------------> UPDATE FIREWALL";
  BlockFireWall;
  AllowIPFireWall;
  textMagenta "----------------> CONFIG SUCCESS"
}
