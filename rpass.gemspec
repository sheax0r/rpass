# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rpass/version"

Gem::Specification.new do |spec|
  spec.name          = "rpass"
  spec.version       = Rpass::VERSION
  spec.authors       = ["Michael Shea"]
  spec.email         = ["mike.shea@gmail.com"]

  spec.summary       = "Reasonable lastpass CLI"
  spec.description   = "A reasonable lastpass CLI"
  spec.homepage      = ""

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  raise "RubyGems 2.0 or newer is required to protect against public gem pushes." unless spec.respond_to?(:metadata)

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "byebug"

  spec.add_dependency "clamp"
  spec.add_dependency "lastpass"
  spec.add_dependency "highline"
  spec.add_dependency "cli-console"
  spec.add_dependency "pbcopy"
  spec.add_dependency "colorize"
end
