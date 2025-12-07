# frozen_string_literal: true

# Application mailer
class ApplicationMailer < ActionMailer::Base
  default from: 'mailer@kognofluo.com'
  layout 'mailer'
end
