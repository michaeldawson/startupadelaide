class AdminMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.contact.subject
  #
  def contact(contact_message)
    @name = contact_message.name
    @email = contact_message.email
    @message = contact_message.message

    mail(to: SiteConfiguration.contact_email, subject: "New contact from #{@name}")
  end
end
