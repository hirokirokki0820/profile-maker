class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to current_user
    end
  end
end
