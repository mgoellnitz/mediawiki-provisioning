CREATE DATABASE {{ wiki_db_schema }};
CREATE USER '{{ wiki_db_user }}'@'localhost' IDENTIFIED BY '{{ wiki_db_password }}';
GRANT ALL PRIVILEGES ON {{ wiki_db_schema }}.* TO '{{ wiki_db_user }}'@'localhost' WITH GRANT OPTION;
