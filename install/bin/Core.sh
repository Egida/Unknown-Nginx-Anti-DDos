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
