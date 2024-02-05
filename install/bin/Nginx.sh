NginxIPAccess(){
  IPNginx=$(sudo awk '{print $1}' $LOG_NGINX/_access.log)
  echo $IPNginx;
}
