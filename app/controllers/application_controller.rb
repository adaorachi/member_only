class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      flash['alert-danger'] = 'You must be logged in to access that page!'
      redirect_to login_path
    end
  end
end
