# require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new("test") do |t|
  t.libs   << "test"
  t.pattern = "test/**/*_test.rb"
  # t.verbose = true
end

desc 'update gem'
task :update do
  sh 'gem build s3etag.gemspec'
  sh 'mv *.gem pkg'
end
