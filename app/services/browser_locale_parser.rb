# frozen_string_literal: true

# Service for parsing the browser's Accept-Language header.
#
# Parses HTTP Accept-Language header following RFC 7231 specification.
# Supports quality values (q-factors) and provides fallback mechanisms
# for base languages (e.g., 'es' → 'es-MX').
#
# @example Basic usage
#   parser = BrowserLocaleParser.new(request)
#   locale = parser.parse # => :"es-MX" or nil
#
# @example Header: "es-ES,es;q=0.8,en;q=0.6"
#   parser.parse # => :"es-MX" (fallback from 'es')
class BrowserLocaleParser
  # -- -------------------------------------------------------------------------
  # -- Initialization ----------------------------------------------------------

  # Initialize the parser with an HTTP request
  #
  # @param request [ActionDispatch::Request] The current HTTP request
  def initialize(request)
    @request = request
  end

  # -- -------------------------------------------------------------------------
  # -- Public Interface --------------------------------------------------------

  # Parse Accept-Language header and return the best matching locale
  #
  # @return [Symbol, nil] The best matching available locale, or nil if none found
  def parse
    return nil unless accept_language_header.present?

    accepted_languages = parse_header
    find_exact_match(accepted_languages) || find_language_fallback(accepted_languages)
  end

  # -- -------------------------------------------------------------------------
  # -- Private Methods ---------------------------------------------------------

  private

  attr_reader :request

  # Extract the Accept-Language header from the request
  #
  # @return [String, nil] The Accept-Language header value
  def accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE']
  end

  # Parse the header into a sorted array of locale strings
  # Sorts by quality value in descending order (highest preference first)
  #
  # @return [Array<String>] Sorted array of locale strings
  def parse_header
    header = accept_language_header
    return [] if header.blank?

    entries = header
      .split(',')
      .map { |entry| parse_language_entry(entry) }
      .sort_by { |entry| -entry[:quality] }

    entries.map { |entry| entry[:locale] }
  end

  # Parse a single language entry with optional quality value
  # Format: "es-MX" or "es-MX;q=0.8"
  #
  # @param entry [String] A single language entry from the header
  # @return [Hash] Hash with :locale and :quality keys
  def parse_language_entry(entry)
    locale, quality = entry.split(';q=')
    {
      locale: locale.strip.downcase,
      quality: quality ? quality.to_f : 1.0
    }
  end

  # Find exact match between accepted languages and available locales
  #
  # @param languages [Array<String>] Ordered array of accepted languages
  # @return [Symbol, nil] First exact match found, or nil
  def find_exact_match(languages)
    available = I18n.available_locales.map(&:to_s)
    languages.find { |locale| available.include?(locale) }&.to_sym
  end

  # Find fallback locale for base languages when no exact match exists
  # Maps base languages to application-specific locales
  #
  # @param languages [Array<String>] Ordered array of accepted languages
  # @return [Symbol, nil] Fallback locale if base language is supported
  def find_language_fallback(languages)
    fallbacks = { 'es' => :'es-MX', 'en' => :en }
    base_languages = languages.map { |locale| locale.split('-').first }
    base = base_languages.find { |lang| fallbacks.key?(lang) }
    fallbacks[base] if base
  end
end
