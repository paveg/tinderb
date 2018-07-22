
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tinderb/version"

Gem::Specification.new do |spec|
  spec.name          = "tinderb"
  spec.version       = Tinderb::VERSION
  spec.authors       = ["Ryota Ikezawa"]
  spec.email         = ["pavegy@gmail.com"]

  spec.summary       = 'API client of Tinder'
  spec.description   = 'This ruby gem is API client of tinder written by ruby launguage'
  spec.homepage      = "https://github.com/paveg/tinderb"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
