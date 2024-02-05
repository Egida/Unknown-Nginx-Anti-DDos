BlockFireWall(){
while read line; do sudo ufw deny from $line; done < APP_INSTALL/IPBlock.txt
}
