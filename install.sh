#!/bin/bash

echo ""
echo "##############################################################################"
echo "#                                                                            #"
echo "#                                                                            #"
echo "#                    WELCOME to UNKNOWN ANTI DDOS                            #"
echo "#                                                                            #"
echo "#                     Copyright (C)  2024 UNKNOWN.                           #"
echo "#                                                                            #"
echo "#                                                                            #"
echo "##############################################################################"
echo "";
echo "----------------> INSTALL SETUP"

rm -rf /usr/local/UnknownDDOS &> /dev/null

mkdir -p /usr/local/UnknownDDOS &> /dev/null

cp -rf install/* /usr/local/UnknownDDOS &> /dev/null

chmod -R +x /usr/local/UnknownDDOS  &> /dev/null

ln -s /usr/local/unknownDDOS/UnknownDDOS.sh /usr/local/bin/UnknownDDOS &> /dev/null

cd ../ || exit

rm -rf Unknown-Nginx-Anti-DDos &> /dev/null

cd /root || exit

echo "----------------> Install Success.Use command 'UnknownDDOS' for use.Thank you"

cd /home || exit
