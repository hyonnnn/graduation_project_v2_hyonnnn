class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@yourdomain.com'  # SendGrid で認証済みメール
  layout 'mailer'
end
