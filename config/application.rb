require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module TutoringAppBackend
  class Application < Rails::Application
    config.load_defaults 7.0

    config.api_only = true

    # Enable session and cookies middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_tutoring_key'

    # Use SameSite=Strict for all cookies to help protect against CSRF
    config.action_dispatch.cookies_same_site_protection = :strict
  end
end
