BlockFireWall(){
while read line; do sudo ufw deny from $line; done < APP_INSTALL/IPBlock.txt
}

NginxIPAccess(){
  IPNginx=$(sudo awk '{print $1}' $LOG_NGINX/access.log)

  echo $IPNginx;
}
