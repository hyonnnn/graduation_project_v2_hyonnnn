require_relative "boot"
require "rails/all"

# Require the gems listed in Gemfile
Bundler.require(*Rails.groups)

module RspecSample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
