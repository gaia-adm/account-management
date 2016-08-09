DROP USER IF EXISTS hpe_account_management;
CREATE DATABASE hpe_account_management;
CREATE USER hpe_account_management WITH SUPERUSER;
ALTER USER hpe_account_management WITH PASSWORD 'hpe_account_management';
GRANT ALL PRIVILEGES ON DATABASE hpe_account_management TO hpe_account_management;



--
--CREATE ROLE gaia_account_management_test WITH SUPERUSER CREATEDB;
--CREATE ROLE gaia_account_management WITH SUPERUSER CREATEDB;
--
--CREATE DATABASE gaia_account_management_test WITH OWNER=gaia_account_management_test;
--CREATE DATABASE gaia_account_management WITH OWNER=gaia_account_management;
