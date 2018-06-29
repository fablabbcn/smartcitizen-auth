# SmartCitizen Authentication Server

https://id.smartcitizen.me

This manages the OAuth 2.0 applications that use https://api.smartcitizen.me

Login requires a smartcitizen account that can to be created at https://smartcitizen.me/kits

It currently redirects to http://example.smartcitizen.me, this behaviour is likely to change so that a user is redirected to a page to manage applications.

## ENV Vars

### Temporary admin username/password for managing all (unscoped) oauth applications

`http_user`
`http_password`


## Development + test

Run `bundle exec guard` to autorun tests


## Docker
First migrate db  
`docker-compose exec app rake db:setup db:migrate`

Then run
`docker-compose up`
