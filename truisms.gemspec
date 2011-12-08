# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "truisms/version"

Gem::Specification.new do |s|
  s.name        = "truisms"
  s.version     = TruiSMS::VERSION
  s.authors     = ["Alexander Kern"]
  s.email       = ["alex@kernul.com"]
  s.homepage    = "https://github.com/CapnKernul/truisms"
  s.summary     = %q{Utilities for working with text messages.}
  s.description = %q{Simple abstractions for dealing with everyone's favorite way to spend 10 cents.}

  s.rubyforge_project = "truisms"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "capybara"
end
