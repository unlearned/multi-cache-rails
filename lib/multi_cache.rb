# frozen_string_literal: true
require 'multi_cache/version'
require 'rails'
require 'multi_cache/rails/application/configuration'
require 'multi_cache/rails.rb'
require 'multi_cache/rails/application/multi_cache_bootstrap'


begin
  require 'pry'
rescue LoadError
end
