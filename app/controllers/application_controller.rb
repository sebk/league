class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_forbidden
    render :template => "/error/401.html.haml", :status => 401
  end

end
