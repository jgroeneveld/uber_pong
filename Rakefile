require "bundler/gem_tasks"
require 'rspec/core/rake_task'

load 'tasks/coverage.rake'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end