# frozen_string_literal: true

source 'https://rubygems.org'

# ================================ CORE RAILS ==================================
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 8.1.1'

# =========================== WEB SERVER & ASSETS ==============================
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem 'propshaft'

# ============================ DATABASE & CACHING ==============================
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '>= 2.1'
# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem 'solid_cache'
gem 'solid_cable'
gem 'solid_queue'

# ================================= FRONTEND ===================================
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'
# Use requestjs-rails for AJAX requests [https://github.com/rails/requestjs-rails]
gem 'requestjs-rails'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'
# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem 'tailwindcss-rails'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# ============================== AUTHENTICATION ================================
# Flexible authentication solution for Rails [https://github.com/heartcombo/devise]
gem 'devise'
# Use Argon2 for password hashing [https://github.com/erdostom/devise-argon2]
gem 'devise-argon2'

# ============================ APPLICATION FEATURES ============================
# Use Gretel for breadcrumbs [https://github.com/kzkn/gretel]
gem 'gretel'
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'
# Use Pagy for pagination [https://ddnexus.github.io/pagy/]
gem 'pagy'
# Track changes to your models [https://github.com/paper-trail-gem/paper_trail]
gem 'paper_trail'
# Use Rails i18n for internationalization [https://guides.rubyonrails.org/i18n.html]
gem 'rails-i18n', github: 'svenfuchs/rails-i18n'
# Use Simple calendar for calendar views
gem 'simple_calendar'

# =============================== DATA EXPORT ==================================
# Excel export functionality
gem 'caxlsx_rails'
# CSV data processing
gem 'csv'

# =============================== PERFORMANCE ==================================
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# =============================== DEPLOYMENT ===================================
# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem 'kamal', require: false
# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem 'thruster', require: false

# ============================ PLATFORM SPECIFIC ===============================
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ windows jruby ]

# ========================== DEVELOPMENT & TESTING =============================
group :development, :test do
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem 'brakeman', require: false
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri windows ], require: 'debug/prelude'
  # Factory Bot for test data generation [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'
  # Faker for realistic fake data [https://github.com/faker-ruby/faker]
  gem 'faker'
  # Use I18n Tasks for i18n tasks [https://github.com/alexdotdev/i18n-tasks]
  gem 'i18n-tasks'
  # Use Letter Opener for previewing emails in the browser
  gem 'letter_opener'
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem 'rubocop-rails-omakase', require: false
end

# ============================ DEVELOPMENT ONLY ================================
group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'
end

# =============================== TEST ONLY ====================================
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end

# ============================= PRODUCTION ONLY ================================
group :production do
  # Use MailGun for sending emails
  gem 'mailgun-ruby'
end
