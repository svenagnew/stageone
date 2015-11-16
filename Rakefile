require 'rake'
require 'rake/packagetask'
require 'rspec/core/rake_task'

task :spec    => 'spec:all'

namespace :spec do
  targets = []
  Dir.glob('./serverspec/spec/*').each do |dir|
    next unless File.directory?(dir)
    targets << File.basename(dir)
  end

  task :all     => targets
  task :default => :all

  targets.each do |target|
    desc "Run serverspec tests to #{target}"
    RSpec::Core::RakeTask.new(target.to_sym) do |t|
      ENV['TARGET_HOST'] = target
      t.pattern = "serverspec/spec/#{target}/*_spec.rb"
    end
  end
end
