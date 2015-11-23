require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

# Default system packages
basepackages = [
    'apache2-utils',
    'coreutils',
    'apticron',
    'logrotate',
    'openjdk-7-jre-headless',
    'python-passlib',
    'screen',
    'ufw',
  ]

application_packages = [
    'elasticsearch',
    'logstash',
    'redis-server'
]

reverse_proxy_packages = [
  'nginx',
  'nodejs'
]

describe "Core packages for #{ENV['TARGET_HOST']} should be installed." do

  basepackages.each do|pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  reverse_proxy_packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  application_packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
