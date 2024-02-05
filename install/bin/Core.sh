uninstallUnknownAD() {
  sudo rm -rf $APP_INSTALL &>/dev/null
  textMagenta "----------------> UNINSTALL SUCCESS"
  exit
}

UpdateUnknownAD() {

  cd /root || exit

  sudo rm -rf $APP_INSTALL &>/dev/null

  git clone https://github.com/EvilUnknown/Unknown-Nginx-Anti-DDos.git && cd Unknown-Nginx-Anti-DDos && bash install.sh &>/dev/null

  rm -rf /root/Unknown-Nginx-Anti-DDos &> /dev/null

  textMagenta "----------------> UPDATE SUCCESS"

  exit

}

killApt() {
  sudo killall apt apt-get &>/dev/null;
  sudo rm /var/lib/apt/lists/lock &>/dev/null;
  sudo rm /var/cache/apt/archives/lock &>/dev/null;
  sudo rm /var/lib/dpkg/lock* &>/dev/null;
}
enableUFW(){
    sudo ufw enable;
}
statusUFW(){
  sudo ufw status;
}

strLength(){
  string=$1;
  echo "${#string}";
}
strPos() {
  haystack=$1
  needle=$2
  x="${haystack%%"$needle"*}"
  [[ "$x" = "$haystack" ]] && { echo -1; return 1; } || echo "${#x}"
}
