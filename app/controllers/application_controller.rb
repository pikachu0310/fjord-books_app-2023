# frozen_string_literal: true

class ApplicationController < ActionController::Base
  around_action :switch_locale

  def default_url_options
    { locale: I18n.locale }.merge(super)
  end

  private

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
