# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'date'
require "cybozu-office/version"

Gem::Specification.new do |s|
  s.name        = "cybozu-office"
  s.required_ruby_version = '>= 1.9.3'
  s.version     = CybozuOffice::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tatsuya Fukata"]
  s.email       = ["tatsuya.fukata@gmail.com"]
  s.homepage    = "https://github.com/fukata/cybozu-office-ruby"
  s.date        = Date.today.to_s
  s.summary     = s.description = %q{Cybozu Office Client (Ruby)}
  s.files       = Dir['LICENSE', 'README.md', 'lib/**/*']
  s.require_paths = ["lib"]
  s.executables = []
  s.license     = 'Apache 2.0'
end
