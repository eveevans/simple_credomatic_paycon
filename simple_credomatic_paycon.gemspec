# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_credomatic_paycon/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_credomatic_paycon"
  spec.version       = SimpleCredomaticPaycon::VERSION
  spec.authors       = ["eveevans"]
  spec.email         = ["eveevansml@gmail.com"]
  spec.description   = "SimpleCredomaticPaycon is a wrapper for interact with Credomatic Paycon"
  spec.summary       = "wrapper for Credomatic Paycon"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
