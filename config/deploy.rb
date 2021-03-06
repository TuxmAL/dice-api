# frozen_string_literal: true

# config valid only for current version of Capistrano
lock '3.11.2'
set :application, 'dice-api'
set :repo_url, 'git@github.com:TuxmAL/dice-api.git'
set :branch, 'master'
set :deploy_to, '/var/www/ruby/dice-api'

namespace :deploy do
  task :start do
    run "mkdir #{current_path}/tmp"
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop do
    # no-op
  end

  task :finalize do
    # run "chown -R 33:33 #{deploy_to}" # on debian 33 is wwwroot's uid and group id
    # run "chmod -R og-rwx #{deploy_to}"
  end

  task :restart do
    deploy.stop
    deploy.start
  end
end

after 'deploy', 'deploy:finalize'
