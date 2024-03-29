# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "theorycrafter"
  spec.version       = "0.1.0"
  spec.authors       = ["meh."]
  spec.email         = ["meh@schizofreni.co"]
  spec.summary       = %q{Theorycrafting library for various games.}
  spec.homepage      = "http://github.com/meh/theorycrafter"
  spec.license       = "WTFPL"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
