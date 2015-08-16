class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def bootstrap_class_for flash_type
    case flash_type
    when 'success'
        "alert-success"
      when 'error'
        "alert-error"
      when 'alert'
        "alert-danger"
      when 'notice'
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
