require 'mina/bundler'
require 'mina/rails'
require 'mina/git'

# Basic settings:
# domain     - The hostname to SSH to
# deploy_to  - Path to deploy into
# repository - Git repo to clone from (needed by mina/git)
# user       - Username in the  server to SSH to (optional)

set :domain, 'mainserver.local'
set :deploy_to, '/var/www/scangallery.local'
set :repository, 'git://github.com/NotGrm/ScanGallery.git'
set :user, 'admin'
# set :port, '30000'

task :environment do
  queue echo_cmd %[export PATH="${HOME}/.rbenv/shims:${PATH}"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue 'touch tmp/restart.txt'
    end
  end
end
