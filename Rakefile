# require 'bundler/gem_tasks'

desc 'update gem'
task :update do
  sh 'gem build s3etag.gemspec'
  sh 'mv *.gem pkg'
end

