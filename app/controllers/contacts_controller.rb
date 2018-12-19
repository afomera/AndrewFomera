class ContactsController < ApplicationController
  def new
    flash[:danger] = "Sorry, the email me functionality has been removed."
    redirect_to root_path
    # @contact = Contact.new
  end

  def create
    flash[:danger] = "Sorry, the email me functionality has been removed."
    redirect_to root_path
     @contact = Contact.new(contacts_params)
     @contact.request = request
     if @contact.deliver
      #  flash.now[:notice] =
      #   'Thank you for your message. We will contact you soon!'
     else
       flash.now[:error] = 'Cannot send message.'
       render :new
     end
   end

   def contacts_params
     params.require(:contact).permit(:name, :email, :message, :nickname)
   end
end
