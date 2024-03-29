# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'uber_pong/version'

Gem::Specification.new do |spec|
  spec.name          = "uber_pong"
  spec.version       = UberPong::VERSION
  spec.authors       = ["Jaap Groeneveld"]
  spec.email         = ["jgroeneveld@me.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"

  # 0.9 nutzen da sonst immer ein stacktrace geprinted wird
  spec.add_development_dependency "rake", "0.9.2.2"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-fire"
  spec.add_development_dependency "simplecov"

  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "minitest", "~> 4.7.0"
  spec.add_development_dependency "mocha"


  spec.add_development_dependency "pry"

  # http://www.fabricationgem.org/
  # wie factory_girl aber keine orm abhaengigkeit
  spec.add_development_dependency "fabrication"

  spec.add_dependency "mutations"

  spec.add_dependency "virtus"

  spec.add_dependency "perpetuity"

end
