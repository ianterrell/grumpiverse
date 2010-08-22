set :application, "grumpiverse"
set :repository,  "set your repository location here"

set :scm, :git

role :web, "www.grumpiverse.com"
role :app, "www.grumpiverse.com"
role :db,  "www.grumpiverse.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end