
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bootsetting/version"


Gem::Specification.new do |spec|
  spec.name          = "bootsetting"
  spec.version       = Bootsetting::VERSION
  spec.authors       = ["CNKCQ"]
  spec.email         = ["chengquan.personal@gmail.com"]

  spec.summary       = %q{happy setting}
  spec.description   = %q{effective command for boot setting}
  spec.homepage      = "https://github.com/CNKCQ/bootsetting.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  # Mac os  bindir = "bin"  Windows  bindir = "exe"
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

 	spec.add_runtime_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "colorize"
  spec.add_development_dependency "rspec", "~> 3.2"
end
