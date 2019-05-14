# UTL Lookup - A Code Cross-reference Utility

## Installation

> *NOTE: The following steps will be replaced with `bin/setup` someday. I hope.*

1. clone repository (of course)
1. Install [yarn](https://yarnpkg.com/en/) if you don't have it.
1. run `yarn install` to install nodejs packages.
1. run `bin/bundle install --path=vendor/bundle` (`--path` optional) to install Ruby gems.
1. Ensure you have [postgresql](https://www.postgresql.org/) up and running, OR configure
the project to use another suitable database. See file 'config/database.yml'.
1. Create a database user UTLLookup with a password and CREATEDB permission. Configure postrgresql to allow login with password for that user (usually in 'pg_hba.conf' file).
1. Set the shell environment variable UTLLOOKUP_DATABASE_PASSWORD to the passoword set above.
1. run `bin/rails db:setup`.
1. run 'bin/rails webpack:compile` (optional; speeds up next steps).
1. run 'bin/rails s'
1. Navigate web browser to [http://localhost:3000/newspapers](http://localhost:3000/newspapers).
