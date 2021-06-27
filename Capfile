require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/scm/git'
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/puma'
require 'capistrano/rails'
require 'whenever/capistrano'

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma
install_plugin Capistrano::Puma::Systemd

set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

set :puma_systemctl_user, :system
set :puma_service_unit_name, 'puma'
# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
