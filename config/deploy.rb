# config valid for current version and patch releases of Capistrano
lock "~> 3.12.1"

set :application, 'grunt_app'
set :user,        'deployer'
set :use_sudo,    true
set :repo_url,    'deployer@50.116.0.100:/home/deployer/repos/grunt_app.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deployer/apps/grunt_app'

# Set a ruby path for rbenv
set :rbenv_path, '/home/deployer/.rbenv/'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 7

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :server do

  desc "Restart the Unicorn master process"
  task :restart_unicorn do
    on roles(:app) do
      execute "/etc/init.d/unicorn_grunt_app restart"
    end
  end

  desc "Show live unicorn log file"
  task :unicorn_log do
    on roles(:app) do
      execute "tail -f #{fetch(:deploy_to)}/shared/log/unicorn.log"
    end
  end

  desc "Show live rails log file"
  task :rails_log do
    on roles(:app) do
      execute "tail -f #{fetch(:deploy_to)}/shared/log/#{fetch(:rails_env)}.log"
    end
  end

  desc "Run rake task on server"
  task :rake do
    on roles(:app) do
      execute "cd #{current_path}; bundle exec rake #{ENV['task']} RAILS_ENV=#{fetch(:rails_env)}"
    end
  end

end

namespace :rails do
  desc "Run the console on a remote server."
  task :console do
    on roles(:app) do |h|
      execute_interactively "RAILS_ENV=#{fetch(:rails_env)} bundle exec rails console", h.user
    end
  end

  def execute_interactively(command, user)
    info "Connecting with #{user}@#{host}"
    cmd = "ssh #{user}@#{host} -p #{fetch(:port)} -t 'cd #{fetch(:deploy_to)}/current && #{command}'"
    exec cmd
  end
end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "/etc/init.d/unicorn_grunt_app restart"
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
