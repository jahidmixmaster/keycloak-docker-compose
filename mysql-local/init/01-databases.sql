# create databases
CREATE DATABASE IF NOT EXISTS `keycloak`;

CREATE USER 'keycloak'@'localhost' IDENTIFIED BY 'password';
CREATE USER 'keycloak'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON keycloak.* To 'keycloak'@'localhost';
GRANT ALL PRIVILEGES ON keycloak.* To 'keycloak'@'%';
flush privileges;
