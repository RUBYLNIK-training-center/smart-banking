# smart-banking
## Quick start

### Requirements
* Ruby 2.7.2
* Git
* Postgresql
* Nodejs
* Yarn
  
### Run app locally
* Clone repo: `git@github.com:RUBYLNIK-training-center/smart-banking.git`
* Install dependencies: `bundle install` 
* Create database: `bundle exec rails db:create db:migrate db:seed`
* Install front-end dependencies: `yarn`
* Run server: `bundle exec rails s`

### Deploy
We are using [capistrano](https://github.com/capistrano/capistrano) for deployment

* Add ssh key to production server: `ssh-copy-id deploy@45.138.72.169`
* Stop puma: `bundle exec cap production puma:stop`
* Run deploy: `bundle exec cap production deploy`
* Start puma: `bundle exec cap production puma:start`

### Our team
* [Boris Tsarikov](https://github.com/B0RlS) (Mentor)
* [Егор Воробьев](https://github.com/Captain-Vorobey)
* [Елизавета Муромская](https://github.com/lizamuromskaya)
* [Виталий Гавриленя](https://github.com/vitalygv)
* [Владислав Митин](https://github.com/m3xq)