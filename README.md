# tesitoo-opencart

How to set up server & corresponding database from this repo from scratch
=========================================================================

Environment
-----------

- apache 2.4
- mod_rewrite enabled
- apache config file
  - for /var/www (or wherever content directory is), ensure the following are set:

          Options Indexes FollowSymLinks
          AllowOverride All

- php 5.x (5.6 recommended)
- mysqli (php extension) !!! any other modules required? !!!
- mysql 5.6
- phpMyAdmin (recommended)

Procedure
-----------------

Using phpMyAdmin
- create a new database (suggest utf8mb4_general_ci)
- create a database user (for API to access)
- give new user all permissions except grant to new db

Opencart source
- clone this repository (https://github.com/projectwife/tesitoo-opencart)
- install in desired location within web-server content directory
- cp config-dist.php config.php
- cp admin/config-dist.php admin/config.php
- cp api/v1/config-dist.php api/v1/config.php
- edit config.php, admin/config.php and api/v1/config.php as necessary :

    all the paths should be changed to correspond to your opencart location

	`DB_USERNAME`, `DB_PASSWORD` and `DB_DATABASE` should be set according to the database & user you created above

File permissions - make the following directories recursively writable by www-data
(apache default user)
- vqmod/
- system/storage/logs/
- system/storage/cache/
- system/storage/download/
- system/storage/upload/
- system/storage/modification/
- image/cache/
- image/catalog/

!!!FIXME need to find way to handle permissions / users programmatically!!!

Database set-up (phpMyAdmin)
- import mtesitoo.sql
