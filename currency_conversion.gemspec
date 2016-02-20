# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'currency_conversion/version'

Gem::Specification.new do |spec|

  spec.name          = "currencyconversion"
  spec.version       = CurrencyLayer::VERSION
  spec.authors       = ["Peter Andreas Moelgaard"]
  spec.email         = ["github@petermolgaard.com"]

  spec.description   = "Ruby Library for the currencylayer API, Reliable Exchange Rates & Currency Conversion, https://currencylayer.com/"
  spec.summary       = "Free and startup-friendly currency converter JSON API for real-time and historical exchange rates - reliable and accurate, supporting 168 world currencies."
  spec.homepage      = "https://github.com/pmoelgaard/currency_conversion"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "hashable"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "dotenv"
  spec.add_development_dependency "bump"
end
