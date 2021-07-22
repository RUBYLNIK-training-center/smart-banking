# [smart-banking](https://smartbanking-epam.ru/)
## Quick start

### Our tech stack
* Rails
* Puma
* Nginx
* Postgresql
* Redis
* Bootstrap

### Run app locally
* Clone repo: `git@github.com:RUBYLNIK-training-center/smart-banking.git`
* Install dependencies: `bundle install` 
* Create database: `bundle exec rails db:setup`
* Install front-end dependencies: `yarn`
* Update crontab for real-time currency updates: `bundle exec whenever --update-crontab --set environment='development'`
* Run server: `bundle exec rails s`

Don't forget to clean crontab up after you're done: `bundle exec whenever --clear-crontab`

### Deploy
We are using [capistrano](https://github.com/capistrano/capistrano) for deployment

* Add your ssh key to production server: `ssh-copy-id <deploy-user>@<deploy-ip>`
* Run deploy: `bundle exec cap production deploy`

### Our team
* [Boris Tsarikov](https://github.com/B0RlS) (Mentor)
* [Egor Vorobyov](https://github.com/Captain-Vorobey)
* [Lizaveta Muromskaya](https://github.com/lizamuromskaya)
* [Vitaly Gavrilenya](https://github.com/vitalygv)
* [Vladislav Mitin](https://github.com/m3xq)
