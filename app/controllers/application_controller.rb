class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

def set_locale
  my_locale = extract_locale_from_tld
  I18n.locale = my_locale || I18n.default_locale
end
def extract_locale_from_tld
  session[:locale] = params[:locale] if params[:locale]
  session[:locale].nil? ? nil : session[:locale].to_sym
end
end
