class ContactMessage < ActiveRecord::Base


	validates :name, presence: true
	validates :email, presence: true
	validates :message, presence: true

	after_create :send_message_notification

	def send_message_notification
		AdminMailer.contact(self).deliver
	end
end
