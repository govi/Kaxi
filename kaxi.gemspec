# -*- encoding: utf-8 -*-
require File.expand_path('../lib/kaxi/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Erick Camacho"]
  gem.email         = ["erick.camacho@raku.mx"]
  gem.description   = %q{Kaxi is a library to compile your Xcode project easily from the command line with a script.
                        With that script is trivial to add your Xcode project to Jenkins using the companion Jenkins
                        plugin. }
  gem.summary       = %q{Kaxi. A script builder for Xcode}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "kaxi"
  gem.require_paths = ["lib"]
  gem.version       = Kaxi::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

end
