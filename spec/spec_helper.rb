if ENV['CI'] == 'true'
  require 'simplecov'
  SimpleCov.start
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!

  # Use more verbose output for single file runs
  config.default_formatter = 'doc' if config.files_to_run.one?

  # exclude gems from backtrace
  config.backtrace_exclusion_patterns << /gems/

  # Print the 10 slowest examples
  config.profile_examples = 10
  config.order = :random
end
