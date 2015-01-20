class ContactMessagesController < InheritedResources::Base
# attr_accessible :name, :email, :message

	def create
	  @contact_message = ContactMessage.new(contact_message_params)

		if @contact_message.save
			flash[:notice]= "Thanks. We've received your message."
		else
			flash[:error]= "Sorry, that message wasn't valid."
		end
	  redirect_to root_path
	end


  def contact_message_params
    params.require(:contact_message).permit(:name, :email, :message)
  end
end
