#!/bin/bash

isSearchEngine(){
  getHostIP=$(host $1)

  verifyEngine=0;

  if [[ $getHostIP == *"google.com"* ]] || [[ $getHostIP == *"googleusercontent.com"* ]]; then
    verifyEngine=1;
  fi

  return $verifyEngine;
}

isIPV4(){
  [[ $1 =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]
}

isIPV6(){
    [[ $1 =~ ^([0-9a-fA-F]{0,4}:){0,7}[0-9a-fA-F]{1,4}$ ]]
}



findStringInDatabase(){

  Response='';

  isInFile=$(cat DATABASE_IP | grep -c $1)

  isInFile=0;

  if [ $isInFile -eq 0 ]; then
     #string not contained in file
     isInFile=0
  else
    isInFile=1
  fi

  if [ $isInFile == 1 ]; then
    Response="$(grep -n $1 DATABASE_IP | head -n 1 | cut -d: -f1)"
  fi

  return $Response;
}

