#!/bin/sh 

echo "---------------------------------------------------------------------"
echo "---     Welcome to the Long Lived Access Token exchange tool      ---"
echo "--- all info can be found @ https://developers.facebook.com/apps/ ---"
echo "---------------------------------------------------------------------"
echo "Paste your Facebook application ID:  "
read APPID

echo "Paste your Facebook App Secret : "
read APPSECRET

echo "Paste your current short-lived access token : (https://developers.facebook.com/tools/access_token)"
read ACCESSTOKEN

echo "------------------------------------"
echo " Using App ID [$APPID]" 
echo " Using App Secret [$APPSECRET]" 
echo " Using Access Token [$ACCESSTOKEN]" 
echo "------------------------------------"

echo "Retrieving long lived token ..."

URL="https://graph.facebook.com/oauth/access_token?client_id=$APPID&grant_type=fb_exchange_token&client_secret=$APPSECRET&fb_exchange_token=$ACCESSTOKEN"
echo " URL: $URL"

app_json=$(curl "$URL")
token=(${app_json//access_token=/ })
token=(${token//&expires=/ })

echo "------------------------------------"
echo " YOUR NEW LONG LIVED ACCESS TOKEN IS :"
echo " $token"
echo "------------------------------------"
