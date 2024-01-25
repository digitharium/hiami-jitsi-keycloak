#!/usr/bin/env bash

function generatePassword() {
    openssl rand -hex 16
}

JICOFO_AUTH_PASSWORD=$(generatePassword)
JVB_AUTH_PASSWORD=$(generatePassword)
JIGASI_XMPP_PASSWORD=$(generatePassword)
JIBRI_RECORDER_PASSWORD=$(generatePassword)
JIBRI_XMPP_PASSWORD=$(generatePassword)

JWT_APP_ID=$(generatePassword)
JITSI_SUB=${JWT_APP_ID}
JWT_APP_SECRET=$(generatePassword)
JITSI_SECRET=${JWT_APP_SECRET}


sed -i.bak \
    -e "s#JICOFO_AUTH_PASSWORD=.*#JICOFO_AUTH_PASSWORD=${JICOFO_AUTH_PASSWORD}#g" \
    -e "s#JVB_AUTH_PASSWORD=.*#JVB_AUTH_PASSWORD=${JVB_AUTH_PASSWORD}#g" \
    -e "s#JIGASI_XMPP_PASSWORD=.*#JIGASI_XMPP_PASSWORD=${JIGASI_XMPP_PASSWORD}#g" \
    -e "s#JIBRI_RECORDER_PASSWORD=.*#JIBRI_RECORDER_PASSWORD=${JIBRI_RECORDER_PASSWORD}#g" \
    -e "s#JIBRI_XMPP_PASSWORD=.*#JIBRI_XMPP_PASSWORD=${JIBRI_XMPP_PASSWORD}#g" \
    -e "s#JWT_APP_ID=.*#JWT_APP_ID=${JWT_APP_ID}#g" \
    -e "s#JITSI_SUB=.*#JITSI_SUB=${JITSI_SUB}#g" \
    -e "s#JWT_APP_SECRET=.*#JWT_APP_SECRET=${JWT_APP_SECRET}#g" \
    -e "s#JITSI_SECRET=.*#JITSI_SECRET=${JITSI_SECRET}#g" \
    "$(dirname "$0")/.env"
    
    

