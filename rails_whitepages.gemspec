# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_whitepages/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_whitepages"
  spec.version       = RailsWhitepages::VERSION
  spec.authors       = ["Ellery J. Durgin"]
  spec.email         = ["ejd91717@gmail.com"]

  spec.summary       = %q{A simple Gem to interface to Whitepages Pro API}
  spec.description   = %q{  A simple Gem to interface to Whitepages Pro API See Readme.md for details}
  spec.homepage      = "https://github.com/ellery/rails_whitepages"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://gem.durgin.co, https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
