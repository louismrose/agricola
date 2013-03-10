require "rspec/core/rake_task"
require "cucumber/rake/task"

task :default => [:features, :spec]

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/*.rb'
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end