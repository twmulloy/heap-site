require 'omniauth/strategies/heap'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :heap, ENV['HEAP_CLIENT_ID'], ENV['HEAP_CLIENT_SECRET'], {
    provider_ignores_state: true
  }
end