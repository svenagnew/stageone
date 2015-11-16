require 'serverspec'
require 'net/ssh'
require 'yaml'

properties = YAML.load_file("#{File.dirname(__FILE__) + '/properties.yml'}")

set :backend, :ssh

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] = properties[host][:user]

set :host,        options[:host_name] || host
set :ssh_options, options
