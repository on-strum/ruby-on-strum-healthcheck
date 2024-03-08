# frozen_string_literal: true

require_relative 'lib/on_strum/gem_name/version'

Gem::Specification.new do |spec|
  spec.name          = 'on_strum-gem_name'
  spec.version       = OnStrum::GemName::VERSION
  spec.authors       = ['Vladislav Trotsenko']
  spec.email         = %w[admin@on-strum.org]
  spec.summary       = %(on_strum-gem_name)
  spec.description   = %(on_strum-gem_name description)
  spec.homepage      = 'https://github.com/on-strum/ruby-on-strum-gem-name'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.5.0'
  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = %w[lib]

  spec.add_development_dependency 'rake', '~> 13.1'
  spec.add_development_dependency 'rspec', '~> 3.13'
end
