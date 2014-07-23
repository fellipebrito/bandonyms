server '54.196.9.255', user: 'ubuntu', roles: %w{web app}

# set custom ssh options
set :ssh_options, {
   keys: %w(config/id_rsa)
}
