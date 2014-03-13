class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :set_locale, except: [:language]

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def set_locale
      session[:lang] = params[:lang] if params.key?(:lang)
      I18n.locale = session[:lang] || I18n.default_locale
    end
end
