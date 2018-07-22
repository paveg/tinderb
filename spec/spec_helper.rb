# frozen_string_literal: true

require 'simplecov'

# set up coverage directory
SimpleCov.coverage_dir(File.join(ENV.fetch('CIRCLE_ARTIFACTS', 'public'), 'coverage'))
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/vendor/'
end

if ENV.fetch('CI', 'false') == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'bundler/setup'
require 'tinderb'
require 'pry'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
