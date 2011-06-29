class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_forbidden
    render :file => File.join(RAILS_ROOT, 'public/403.html'), :status => :forbidden, :layout => false   #work
  end

end
