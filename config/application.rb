require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Board
  class Application < Rails::Application
    config.web_console.whitelisted_ips = %w(192.168.0.61 192.168.0.24 192.168.0.16 192.168.0.86)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Moscow'

    config.i18n.default_locale = :ru

    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]

    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache'
  end
end
