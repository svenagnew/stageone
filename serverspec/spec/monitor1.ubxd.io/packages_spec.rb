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

graphite_packages = [
  'graphite-web',
  'graphite-carbon',
  'graphite-web',
  'graphite-carbon',
  'postgresql',
  'libpq-dev',
  'python-psycopg2',
  'apache2',
  'libapache2-mod-wsgi'
]

describe "Core packages for #{ENV['TARGET_HOST']} should be installed." do

  basepackages.each do|pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  graphite_packages.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end
end
