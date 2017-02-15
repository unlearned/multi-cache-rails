# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'multi_cache/version'

Gem::Specification.new do |spec|
  spec.name          = 'multi_cache-rails'
  spec.version       = MultiCache::Rails::VERSION
  spec.authors       = ['Takashi Uesugi']
  spec.email         = ['tksuesg@gmail.com']
  spec.summary       = 'Multiple caches configuration for Ruby On Rails.'
  #spec.description = 'TODO: Write a longer description. Optional.'
  spec.homepage      = 'https://github.com/unlearned/multi-cache-rails'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r(^bin/)) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'railties', '~> 5.0'
end
