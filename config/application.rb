require File.expand_path('../boot', __FILE__)
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Kssksscoincoin
  class Application < Rails::Application
    # Add Bower components
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
  end
end
