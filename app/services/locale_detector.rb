# frozen_string_literal: true

# Service for detecting the appropriate locale for a user request.
# Implements a priority-based locale detection system:
# 1. URL parameters (?locale=es)
# 2. User's preferred locale
# 3. Browser's Accept-Language header
# 4. Application default (en)
#
# @example Basic usage
#   detector = LocaleDetector.new(request, current_user)
#   locale = detector.detect # => :en
#
# @example URL parameter takes precedence
#   # GET /path?locale=es-MX
#   detector.detect # => :"es-MX"
class LocaleDetector
  # -- -------------------------------------------------------------------------
  # -- Initialization ----------------------------------------------------------

  # Initialize the locale detector
  #
  # @param request [ActionDispatch::Request] The current HTTP request
  # @param current_user [User, nil] The authenticated user (optional)
  def initialize(request, current_user = nil)
    @request = request
    @current_user = current_user
  end

  # -- -------------------------------------------------------------------------
  # -- Public Interface --------------------------------------------------------

  # Detect the most appropriate locale for the current context
  #
  # @return [Symbol] The detected locale (e.g., :"es-MX", :en)
  def detect
    determine_locale
  end

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private

  attr_reader :request, :current_user

  # Determine locale based on priority hierarchy
  #
  # @return [Symbol] The first valid locale found in priority order
  def determine_locale
    url_locale || user_locale || browser_locale || default_locale
  end

  # Extract and validate locale from URL parameters
  #
  # @return [Symbol, nil] The locale if valid, nil otherwise
  def url_locale
    params_locale = request.params[:locale]
    params_locale.to_sym if valid_locale?(params_locale)
  end

  # Get the authenticated user's preferred locale
  #
  # @return [Symbol, nil] The user's locale if valid, nil otherwise
  def user_locale
    return nil unless current_user&.locale.present?

    current_user.locale.to_sym if valid_locale?(current_user.locale)
  end

  # Parse the browser's Accept-Language header
  #
  # @return [Symbol, nil] The best matching locale from browser, nil if none match
  def browser_locale
    BrowserLocaleParser.new(request).parse
  end

  # Application default locale
  #
  # @return [Symbol] Always returns :en
  def default_locale
    :en
  end

  # Validate if a locale is available in the application
  #
  # @param locale [String, Symbol, nil] The locale to validate
  # @return [Boolean] True if locale is present and available
  def valid_locale?(locale)
    locale.present? && I18n.available_locales.include?(locale.to_sym)
  end
end
