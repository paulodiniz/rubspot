# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubspot/version'

Gem::Specification.new do |spec|
  spec.name          = "rubspot"
  spec.version       = Rubspot::VERSION
  spec.authors       = ["Paulo Diniz"]
  spec.email         = ["paulo.rc.diniz@gmail.com"]
  spec.summary       = %q{Hubspot wrapper.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "representable"
  spec.add_dependency "httpclient"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "pry"
end
