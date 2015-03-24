require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Heap < OmniAuth::Strategies::OAuth2

      option :name, :heap

      option :client_options, {
        site: ENV['HEAP_SITE_URI'] || 'https://hheap.com',
        authorize_url: '/oauth/authorize'
      }

      uid { owner['id'] }

      info do
        {
          email: owner['email']
        }
      end

      extra do 
        {}
      end

      def owner
        @owner ||= access_token.get('/v1/me').parsed
      end
    end
  end
end