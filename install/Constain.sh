#!/bin/bash
export DIR_DATABASE_IP=/usr/local/UnknownAD/databaseIP.json
export ALLOW_COUNTRY="Vietnam"
export ALLOW_ASN="24086,7643,18403"

setVariablesSystem() {
  if [ -f ~/.constainUAD ]; then
    source ~/.constainUAD
  else
    touch ~/.constainUAD
    chmod 777 ~/.constainUAD
    cat >~/.constainUAD <<EOF
export DIR_DATABASE_IP=/usr/local/UnknownAD/databaseIP.json
export ALLOW_COUNTRY='Vietnam'
export ALLOW_ASN='24086,7643,18403'
EOF
  fi
}

setVariablesSystem;

verifyUNKDDOS() {
  if [[ -f "$FILE" ]]; then
      textRed "----------------> PLEASE CHECK FILE DATABASE IP"
      exit
  fi
}

configAntiDdos() {
  echo "----------------> CONFIG UNKNOWN ANTI DDOS"

  read -p "----------------> INPUT DIR DATABASE IP : " DIR_DATABASE_IP

  read -p "----------------> INPUT ALLOW COUNTRY : " ALLOW_COUNTRY

  read -p "----------------> INPUT ALLOW NUMBER ANS : " ALLOW_ASN


  if [[ -z "$DIR_DATABASE_IP" ]] || [[ -z "$ALLOW_COUNTRY" ]] || [[ -z "$ALLOW_ASN" ]]; then
    textRed "----------------> PLEASE CHECK CONFIG AGAIN"
    exit
  fi

  cat >~/.constain <<EOF
export DIR_DATABASE_IP=$DIR_DATABASE_IP
export ALLOW_COUNTRY=$ALLOW_COUNTRY'
export ALLOW_ASN=$ALLOW_ASN
EOF

  textMagenta "----------------> CONFIG SUCCESS"
  exit
}