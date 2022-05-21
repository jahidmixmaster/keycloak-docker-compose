#!/bin/bash

loginCommand="./opt/keycloak/bin/kcadm.sh config credentials --server $KC_SERVER --realm master --user $KEYCLOAK_ADMIN --password $KEYCLOAK_ADMIN_PASSWORD"

until $loginCommand
do
    sleep 15
done

./opt/keycloak/bin/kcadm.sh create users  -r "$KC_SECONDARY_REALM" -s username="$KC_SECONDARY_REALM_CLIENT_USER" -s enabled=true
./opt/keycloak/bin/kcadm.sh set-password -r "$KC_SECONDARY_REALM" --username "$KC_SECONDARY_REALM_CLIENT_USER" --new-password "$KC_SECONDARY_REALM_CLIENT_USER_PASSWORD"
./opt/keycloak/bin/kcadm.sh add-roles -r "$KC_SECONDARY_REALM" --uusername "$KC_SECONDARY_REALM_CLIENT_USER" --cclientid "$KC_SECONDARY_REALM_CLIENT" --rolename "$KC_SECONDARY_REALM_CLIENT_ROLE"