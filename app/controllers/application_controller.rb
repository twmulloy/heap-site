class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def auth_callback
    auth = env['omniauth.auth']
    session[:token] = auth.credentials.token
    redirect_to(:root)
  end

  # rescue_from OAuth2::Error do |exception|
  #   if exception.response.status == 401
  #     session[:token] = nil
  #     redirect_to('/auth/heap')
  #   end
  # end

  private

  def oauth_client
    @oauth_client ||= OAuth2::Client.new(ENV['HEAP_CLIENT_ID'], ENV['HEAP_CLIENT_SECRET'], site: ENV['HEAP_SITE_URI'])
  end

  def access_token
    if session[:token]
      @access_token ||= OAuth2::AccessToken.new(oauth_client, session[:token])
    end
  end

end
