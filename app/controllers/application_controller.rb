class ApplicationController < ActionController::Base
  protect_from_forgery

#  rescue_from ActiveRecord::RecordNotFound, :with => :throw_404

  def render_forbidden
    render :file => File.join(Rails.root.to_s, 'public/403.html'), :status => :forbidden, :layout => false
  end

  def throw_404
    render :file => File.join(Rails.root.to_s, 'public/404.html'), :status => :not_found, :layout => false
  end

end
