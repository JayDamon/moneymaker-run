## Setup

### Host file
To ensure that the applications can properly authorize requests, you need to add an entry to the hosts file
which points your local ip to the dns name keycloak with the following entry

`127.0.0.1 keycloak`

### Stop Specific application
`docker compose stop {compose-app-name}`