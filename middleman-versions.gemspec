# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "middleman-versions"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Pedro Rivas"]
  s.email       = ["rmdrobs@gmail.com"]
  s.homepage    = "https://github.com/ednegocios/middleman-versions.git"
  s.summary     = %q{Add versions to web by data}
  s.description = %q{Add versions to web by data}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 4.0.0"])

  # Additional dependencies
  # s.add_runtime_dependency("gem-name", "gem-version")
end
