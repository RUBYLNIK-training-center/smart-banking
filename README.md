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
* Create database: `bundle exec rails db:create db:migrate db:seed`
* Install front-end dependencies: `yarn`
* Run server: `bundle exec rails s`

### Deploy
We are using [capistrano](https://github.com/capistrano/capistrano) for deployment

* Add your ssh key to production server: `ssh-copy-id <deploy-user>@<deploy-ip>`
* Stop puma: `bundle exec cap production puma:stop`
* Run deploy: `bundle exec cap production deploy`

### Our team
* [Boris Tsarikov](https://github.com/B0RlS) (Mentor)
* [Egor Vorobyov](https://github.com/Captain-Vorobey)
* [Lizaveta Muromskaya](https://github.com/lizamuromskaya)
* [Vitaly Gavrilenya](https://github.com/vitalygv)
* [Vladislav Mitin](https://github.com/m3xq)