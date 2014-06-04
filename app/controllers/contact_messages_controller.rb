class ContactMessagesController < InheritedResources::Base
# attr_accessible :name, :email, :message

	def create
	  	@contact_message = ContactMessage.new(params[:contact_message])

		if @contact_message.save
			flash[:notice]= "Thanks. We've received your message."
		else
			flash[:error]= "Sorry, that message wasn't valid."
		end
	  	redirect_to contact_path
	end
end
