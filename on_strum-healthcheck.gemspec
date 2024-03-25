# frozen_string_literal: true

require_relative 'lib/on_strum/healthcheck/version'

Gem::Specification.new do |spec|
  spec.name          = 'on_strum-healthcheck'
  spec.version       = OnStrum::Healthcheck::VERSION
  spec.authors       = ['Vladislav Trotsenko']
  spec.email         = %w[admin@on-strum.org]
  spec.summary       = %(Simple configurable rack middleware)
  spec.description   = %(Simple configurable rack middleware.)
  spec.homepage      = 'https://github.com/on-strum/ruby-on-strum-healthcheck'
  spec.license       = 'MIT'

  current_ruby_version = ::Gem::Version.new(::RUBY_VERSION)
  ffaker_version = current_ruby_version >= ::Gem::Version.new('3.0.0') ? '~> 2.23' : '~> 2.21'

  spec.required_ruby_version = '>= 2.5.0'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = %w[lib]

  spec.add_runtime_dependency 'rack', '>= 2.0.1'

  spec.add_development_dependency 'ffaker', ffaker_version
  spec.add_development_dependency 'json_matchers', '~> 0.11.1'
  spec.add_development_dependency 'rake', '~> 13.1'
  spec.add_development_dependency 'rspec', '~> 3.13'
end
