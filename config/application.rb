require_relative 'boot'
require 'csv'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AdminDemo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.generators.system_tests = nil
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.generators.javascript_engine = :js
    config.generators do |g|
      g.test_framework nil, fixture: false
      g.stylesheets false
      g.javascripts false
      g.jbuilder false
      g.helper false
      g.controller :test_framework => false, :helper => false, :assets => false
      g.view_specs false
      g.helper_specs false
      g.system_tests = nil
    end

    config.action_view.embed_authenticity_token_in_remote_forms = true

  end
end
