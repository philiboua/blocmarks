ActionMailer::Base.smtp_settings = {
  address:         'smtp.mailgun.org',
  port:            '587',
  user_name:       ENV['MAILGUN_SMTP_LOGIN'],
  password:        ENV['MAILGUN_SMTP_PASSWORD'],
  domain:          'heroku.com',
  authentication:  :plain,
  content_type:    'text/html'
}
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.raise_delivery_errors = true

# This interceptor just makes sure that local mail 
# only emails you.
# http://edgeguides.rubyonrails.org/action_mailer_basics.html#intercepting-emails
class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.to =  'philippeaka@outlook.com'
    message.cc = nil
    message.bcc = nil
  end
end

# Locally, outgoing mail will be 'intercepted' by the
# above DevelopmentMailInterceptor before going out
if Rails.env.development?
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
end