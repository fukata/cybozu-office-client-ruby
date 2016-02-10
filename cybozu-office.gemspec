# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'date'
require "cybozu-office/version"

Gem::Specification.new do |gem|
  gem.name        = "cybozu-office"
  gem.version     = CybozuOffice::VERSION

  gem.authors     = ["Tatsuya Fukata"]
  gem.email       = ["tatsuya.fukata@gmail.com"]
  gem.summary     = gem.description = %q{Cybozu Office Client (Ruby)}
  gem.homepage    = "https://github.com/fukata/cybozu-office-ruby"
  gem.license     = 'Apache 2.0'
  
  gem.files       = `git ls-files`.split($\) 
  gem.executables = []
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.has_rdoc    = false

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency "rest-client", ["~> 1.8.0"]
  gem.add_dependency "xml-simple", ["~> 1.1.5"]
  gem.add_development_dependency "rake", ["~> 10.5.0"]
  gem.add_development_dependency "rspec", ["~> 3.4.0"]
end
