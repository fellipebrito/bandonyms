# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'bandonyms'
set :log_level, :info #debug
#set :rvm_ruby_version, '2.0.0-p451'

set :repo_url, 'git@github.com:fellipebrito/bandonyms.git'
set :branch,   proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :deploy_to, '/var/www/bandonyms'

# Aliases
set :linked_files, %w{ config/database.yml config/settings.yml }
set :linked_dirs, %w{ bin log tmp/pids tmp/cache tmp/sockets vendor/bundle }

# Unicorn Defs
set :unicorn_config_path, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/tmp/pids/unicorn.pid"

# Rails Defs
# set :rails_env, 'production'
set :unicorn_rack_env, 'production'

set :default_environment, {
  'RACK_ENV' => 'production'
}

after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
