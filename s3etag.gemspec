# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "s3etag"
  s.version     = '0.0.1'
  s.authors     = ["swdyh"]
  s.homepage    = "https://github.com/swdyh/s3etag"
  s.summary     = %q{calculate AWS S3 etag}
  s.description = %q{calculate AWS S3 etag}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = ['s3etag']
  s.require_paths = ["lib"]
end
