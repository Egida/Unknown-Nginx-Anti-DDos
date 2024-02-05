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

cd /root || exit

rm -rf /usr/local/UnknownAD &> /dev/null

mkdir -p /usr/local/UnknownAD &> /dev/null

cp -rf install/* /usr/local/UnknownAD &> /dev/null

chmod -R +x /usr/local/UnknownAD  &> /dev/null

ln -s /usr/local/UnknownAD/UnknownAD.sh /usr/local/bin/UnknownAD &> /dev/null

ln -s /usr/local/UnknownAD/UnknownADC.sh /usr/local/bin/UnknownADC &> /dev/null

rm -rf /root/Unknown-Nginx-Anti-DDos &> /dev/null

echo "----------------> Install Success.Use command 'UnknownAD' for use.Thank you"

cd /root || exit
