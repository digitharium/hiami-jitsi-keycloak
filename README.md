
# Template Repository
[![License: BSD3](https://img.shields.io/badge/License-BSD3-blue.svg)](https://opensource.org/license/bsd-3-clause/)

[![Trigger Jenkins Pipe](https://github.com/digitharium/hiami-jitsi-keycloak/actions/workflows/main.yml/badge.svg)](https://github.com/digitharium/hiami-jitsi-keycloak/actions/workflows/main.yml)

## Introduction
This repository is a template for all the repositories that will be used at the hackathon 2024 part of the symposium.

## Contributors
* [Christophe Vandeplas](https://github.com/cvandeplas)
* [Christoph](https://github.com/guschtel)
* ...

Some elements, such as most of the `docker-compose.yml` and `.env` are coming from [docker-jitsi-meet](https://github.com/jitsi/docker-jitsi-meet)

See also the [devops-guide-docker documentation](https://jitsi.github.io/handbook/docs/devops-guide/devops-guide-docker/) for more information.

## Instructions
For now the setup requires authentication for making and joining conf-calls. It does not allow guests.


In order to quickly run Jitsi Meet on a machine running Docker and Docker Compose, follow these steps:

Clone this repository.

Create a .env file by copying and adjusting env.example:

```
cp env.example .env
```

Set strong passwords in the security section options of .env file by running the following bash script
```
./gen-passwords.sh
```
Create required CONFIG directories

For linux:
```
mkdir -p ~/.jitsi-meet-cfg/{web,transcripts,prosody/config,prosody/prosody-plugins-custom,jicofo,jvb,jigasi,jibri}
```

Configure KeyCloak (webUI or through CLI) and set the configuration variables in the `.env` file: 
- In the admin webui: Create Client : client_id = jitsi
- client authentication: on
- authentication flow: check standard flow, unckecl direct access grants
- root URL: no implication
- home URL: no implication
- valid redirect URIs: enter URL of the JITSI that should be loaded after authentication == http://middleware_hostname:9000/*
- web origins = http://middleware_hostname:9000/*
- credentials tab: take client secret and set below as CLIENT_SECRET

Run `docker compose up -d`

Access the web UI at https://localhost:8443 (or a different port, in case you edited the .env file).

## More info
Requires:
- public IP/vhost for KeyCloak : tcp/443 
- public IP/vhost for JITSI : tcp/443, udp/10000 
- public IP/vhost for JitsiAuthMiddleware: tcp/443
- hostnames (to be further researched and defined)

## TODO
- [ ] middleware needs to run on 443 with valid SSL
- [ ] disable HTTP
- [ ] further work out guest support
- [ ] have a list of variables for hostname(s), and generate everything using these hostnames
- [ ] harden all

