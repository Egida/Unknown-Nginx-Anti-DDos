#!/bin/bash
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

isIPV4(){
  if [[ $1 =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
    echo 1;
    else
      echo 0;
  fi
}

isIPV6(){
    if [[ $1 =~ ^([0-9a-fA-F]{0,4}:){0,7}[0-9a-fA-F]{1,4}$ ]]; then
      echo 1;
      else
        echo 0;
    fi
}

GetIPArray(){
  IPArray='';

  isIp4=$(isIPV4 "$1");

  isIp6=$(isIPV6 "$1");

  verifyIP=0;

  if [[ isIp4 -eq 1 ]]; then
    IFS='.' read -r -a Args <<< "$1";
    verifyIP=1;
    else

      if [[ isIp6 -eq 1 ]]; then
        IFS=':' read -r -a Args <<< "$1";
        verifyIP=1;
      fi
  fi

  if [[ verifyIP -eq 1 ]]; then
      for element in "${Args[@]}"
      do
        if [[ -z $IPArray ]]; then
          IPArray=$element;
          else
            if [[ isIp4 -eq 1 ]]; then
              IPArray="$IPArray $IPArray.$element";
              else
              IPArray="$IPArray $IPArray:$element";
            fi

        fi
      done
      IPArray=$(echo "${IPArray[@]}" | tr '[:space:]' '\n' | awk '!a[$0]++' | tac | xargs);
      echo $IPArray;

  fi

}



getInfoIP(){

  isIp4=$(isIPV4 "$1");
  isIp6=$(isIPV6 "$1");
  verifyIP=0;

  if [[ isIp4 -eq 1 ]] || [[ isIp6 -eq 1 ]] ; then

    IpAddress=$1;

      IpAddress=$(sed "s/::/:0000:/g" <<< "$IpAddress");

      GetIPList=$(GetIPArray $IpAddress);

      IFS=' ' read -r -a IPArray <<< "$GetIPList"
      response='';

       for element in "${IPArray[@]}"
        do

          if [[ isIp4 -eq 1 ]]; then
            tmp=$(findDBIP4 "$element");
            else
              tmp=$(findDBIP6 "$element");
          fi

          if [[ $(strLength $tmp) -gt 3 ]]; then
            response=$tmp;
            break;
          fi
        done
        echo $response;
  fi

}

findDBIP4(){
  Response=$(grep -a "\"$1\." $DIR_DATABASE_IP | head -n 1);
  echo $Response;
}

findDBIP6(){
  Response=$(grep -a "\"$1:" $DIR_DATABASE_IP | head -n 1);
  echo $Response;
}
