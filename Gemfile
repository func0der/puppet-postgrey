# frozen_string_literal: true

source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :test do
  gem 'metadata-json-lint'
  gem 'puppet', ENV['PUPPET_GEM_VERSION']
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint-absolute_classname-check'
  gem 'puppet-lint-leading_zero-check'
  gem 'puppet-lint-trailing_comma-check'
  gem 'puppet-lint-version_comparison-check'
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
  gem 'puppet-lint-unquoted_string-check'
  gem 'puppet-lint-resource_reference_syntax'
  gem 'rake'
  gem 'rspec-puppet'
  gem 'rspec-puppet-facts'
  gem 'rubocop'
  gem 'simplecov'
  gem 'simplecov-console'
end

group :development do
  gem 'travis'              if RUBY_VERSION >= '2.1.0'
  gem 'travis-lint'         if RUBY_VERSION >= '2.1.0'
  gem 'guard-rake'          if RUBY_VERSION >= '2.2.5' # per dependency https://rubygems.org/gems/ruby_dep
  gem 'puppet-blacksmith'
end

group :system_tests do
  gem 'beaker'
  gem 'beaker-rspec'
  gem 'beaker-puppet_install_helper'
end
