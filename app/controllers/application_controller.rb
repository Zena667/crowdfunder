class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to new_session_path, alert: "Please login first." # (if not authenticated redirect to new_session_path with error (alert: "Please login first."))
  end


end
