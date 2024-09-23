## Setup

### Host file
To ensure that the applications can properly authorize requests, you need to add an entry to the hosts file
which points your local ip to the dns name keycloak with the following entry

`127.0.0.1 keycloak`

### Stop Specific application
`docker compose stop {compose-app-name}`

## New App
1. Create git repository for new app named after the new app name
2. Add app name to `project-list` document
3. Add app name to `setup-project.sh` `services` list
4. If the new app is in need of a volume, then add app name to `./data/setup.sh` `directories` list
5. Run script `setup-project.sh`
   * NOTE: This will clone the newly created repository into your project directory
6. Create new app in the newly cloned project directory
   1. Create Project and add to new directory
      * For Go
           * Create directory with the app name
           * cd into that directory
           * `go mod init github.com/jaydamon/app-name`
      * Spring Boot
          * [Spring Initializer](https://start.spring.io/)
          * Copy app into directory
   2. Copy .gitignore from relevant project type to your directory
   3. Copy Dockerfile from relevant project type to your directory and change any project specific values
   4. Add project to intellij
   5. Commit and push initial commit to remote git
7. If app is a web app, add it to keycloak
   1. Navigate to admin console `http://keycloak:8081/auth/` <-- local example
   2. Select realm "moneymaker"
   3. Select "Clients"
   4. Select "Create Client"
   5. Add client id that matches the project name added to `project-list`
   6. Select "Next"
   7. Toggle "Client Authentication" to "On"
   8. Ensure only "Direct access grants" and "Service accounts roles" are selected
   9. Under the new client, go to the "Credentials" tab
   10. Ensure a Client Secret Exists
   11. Export Keycloak realm setting doc
       1. While "moneymaker" realm is selected, navigate to "Realm settings" under configure
       2. Select the "Action" dropdown in the top right
       3. Click on "Partial Export"
       4. Ensure both "Include groups and roles" and "Include clients" are toggled "On"
       5. Click "Export" and save to `./keycloak` directory in this project
          * NOTE: Make sure you backup the old `realm-export.json` to the `moneymaker-realm.json` before overriding it
       6. Under the json path `clients` replace the value for `"secret": "**********"` with the accurate client secret backed up in the `moneymaker-realm.json` object
          1. For the new service, you can retrieve the secret from Clients -> service name -> Credentials -> Client Secret
          2. Services in need of update (Add your new service name to this list):
             1. `account-link-service`
             2. `account-service`
             3. `account-update-service`
             4. `budget-service`
             5. `transaction-service`
             6. `transaction-update-service`
             7. `user-service`
8. Add new service entry to `docker-compose.yml`
   * Ensure the port selected is not currently in use
9. Add to `Makefile`
   1. add build_app_name entry
   2. add up_app_name entry
   3. add up_build_app_name entry
   4. Add new build_app_name reference to the `build` command
5. Runn `make up_build` to ensure application runs successfully 
