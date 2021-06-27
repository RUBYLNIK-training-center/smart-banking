lock "~> 3.16.0"

set :application, "smart-banking"
set :repo_url, "git@github.com:RUBYLNIK-training-center/smart-banking.git"
set :deploy_to, "/home/deploy/deploy/smart-banking"

append :linked_dirs, '.bundle'

set :bundle_jobs, 1
set :bundle_flags, ''   
