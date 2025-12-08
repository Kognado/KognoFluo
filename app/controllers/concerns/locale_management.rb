# frozen_string_literal: true

# Concern for managing locale detection and switching in controllers.
#
# Automatically detects and sets the appropriate locale for each request
# using the LocaleDetector service. The locale is scoped to the current
# request and restored after the action completes.
#
# @example Include in controllers
#   class ApplicationController < ActionController::Base
#     include LocaleManagement
#   end
#
# The locale detection follows this priority:
# 1. URL parameter (?locale=en)
# 2. Authenticated user's preference
# 3. Browser Accept-Language header
# 4. Application default (en)
module LocaleManagement
  extend ActiveSupport::Concern

  included do
    around_action :switch_locale
  end

  private

  # Switch to the appropriate locale for the duration of the request
  #
  # Uses LocaleDetector to determine the best locale and temporarily
  # switches I18n.locale for the duration of the controller action.
  #
  # @yield The controller action to execute with the detected locale
  # @return The result of the yielded block
  def switch_locale(&action)
    locale = LocaleDetector.new(request, current_user).detect
    I18n.with_locale(locale, &action)
  end
end
