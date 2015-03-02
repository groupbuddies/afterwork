require File.expand_path('../config/application', __FILE__)
Rails.application.load_tasks

if %w(development test).include? Rails.env
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  task(:default).clear
  task default: [:rubocop, :spec]
end
if defined?(RSpec)
  task(:spec).clear

  desc 'Run all specs'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = '--tag ~factory'
  end

  desc 'Run factory specs.'
  RSpec::Core::RakeTask.new(:factory_specs) do |t|
    t.pattern = './spec/models/factories_spec.rb'
  end

  task spec: :factory_specs
end
task(:default).clear
task :default => [:spec]
