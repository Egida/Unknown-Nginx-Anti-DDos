NginxIPAccess(){
  IPNginx=$(sudo awk '{print $1}' $LOG_NGINX/access.log)
  echo $IPNginx;
}
