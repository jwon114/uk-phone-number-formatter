lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "surveyor"
  spec.version       = Formatter::PhoneNumber::UK::VERSION
  spec.authors       = ["James Wong"]

  spec.summary       = "Formats and Validates UK Phone Number"

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.14"
  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "rubocop"
end
