class HomeController < ApplicationController
  def index
    @items = (access_token) ? access_token.get('v1/items').parsed : []
  end
end
