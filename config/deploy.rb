set :application, "opentheque"

set :scm, :git
set :deploy_via, :remote_cache
set :scm_verbose, true
set :use_sudo, false

set :repository, "git@github.com:sgruhier/rennes-on-rails.git"
set :user, 'deploy'
set :deploy_to, "/var/www/railsapp/#{application}"
set :branch,     'master'

role :web, "opentheque.net"                   # Your HTTP server, Apache/etc
role :app, "opentheque.net"                   # This may be the same as your `Web` server
role :db,  "opentheque.net", :primary => true # This is where Rails migrations will run

after 'deploy:update_code', :copy_database_yml

task :copy_database_yml do
  run "cp #{shared_path}/resources/database.yml #{release_path}/config/"
end

namespace :deploy do
  task :start do
  end
  task :stop do
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
