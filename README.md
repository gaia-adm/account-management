# gaia-account-management

This app is build in [NodeJS](https://nodejs.org), with an [Express](https://expressjs.com)-based api and a PostgreSQL database.

## Setup for development
- See individual readme files

## Docker
- ```docker-compose up``` will start three containers: db, backend, and client
- after bringing up services, any combination of the following commands may be necessary (but, by default, the DB will be migrated to latest and seeded with production data)
- ```docker-compose run backend knex migrate:latest``` will migrate to the latest db
- ```docker-compose run backend knex seed:run``` will seed/re-seed the production environment with essential data. It will NOT delete data from the DB instance
- ```docker-compose run backend knex seed:run --env=reset``` will delete everything in the db
    
## Notes for developers
- The front-end app is designed to be written with ES2015 using AngularJS 1.5+, compiled by webpack. [This page](http://angular-tips.com/blog/2015/06/using-angular-1-dot-x-with-es6-and-webpack/) does a really great job of outlining when to use (and not use) classes.
- Injection/annotation is handled by the ngAnnotatePlugin.
- Both dev environments (backend and client) are started from their root directories using ```npm run start:dev```
- ```.env``` file needed for backend and client

## Notes for developers 2 - how to work with submodules
- This repository is superset of other repositories: db, server and client. One should clone this repository with *"--recursive"* option to bring the submodules too
- By default submodules are in *"detached HEAD"* state. If one want to clone this repository once and work with submodules, it should be done as following:
  - For every submodule run ```git checkout master``` (or any other branch you want to use) and only then commit your changes
  - Once submodule change has been committed, up to this repository folder and run ```git add <submodule-name>```, for example, "git add server". Before running this, you can check the status using *git status* and *git diff* commands
  - Then commit the just added change as usually, e.g., ```git commit -m 'update on submodule change'``` and push it

## Demo Flow
1. In the folder /seeds/production, the file ```1_production.js``` lists the initial production seeding of the database. The site uses Google Sign-On (and eventually more... but right now just Google), so you'll want to seed the database with your own google email address (or addresses) to validate a variety of scenarios. That file identifies the following (where you are advised to change the values of the email addresses to see how the site responds to these four distinct levels of security)
    - Awesome Superuser (id:2, email: richard.plotkin@toptal.com)
    - Site Admin (id:3, email: richardjplotkin@gmail.com)
    - Account Admin (id:4, email: richard@richardplotkin.com)
    - Account Analyst (id:5, email:emilykplotkin@gmail.com)
2. From the project root, run ```docker-compose up```
3. Internally, ```docker-compose``` will have created
    - a database at :5432
    - a server at :3000
    - a client at :8080
4. Externally, the client is exposed at :8080, so after your app is running, go [here](http://localhost:8080/).
5. Sign in with your superuser email to have full access to the site
6. After signing in, across the top of the app you will see HOME, ACCOUNTS, and USERS, along with a "Log Out" link.
7. USERS is only available to a superuser. It will display a list of existing users, and allow an admin to create a new user without tying that user to a specific account. This is useful for assigning multiple email addresses to the same user.
8. ACCOUNTS is available to a superuser, site admin, and account admin (limited). With a seeded production database, only users are created by default. So it is up to a superuser or site admin to create a new account. At this time, go ahead and **Create an account**
9. After creating an account, click the account name to view/edit its details. In this interface, you will usually see a list of users, and have the ability to invite additional users (by email address) to the account. At this time, go ahead and **Invite a user** using an email address that you own.
10. Follow the link in the email you will receive, and accept the invitation.
11. When you return to ACCOUNTS > EDIT ACCOUNT, you will see the user listed.
12. Log out, and sign in as the new user. Depending on the permissions granted, as well as the isSuperuser and isSiteAdmin flags previously set on that user account, the user may be able to access the admin interface.
