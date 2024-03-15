class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver!
      flash[:sucess] = 'Message sent!'
      redirect_to root_path
    else
      flash[:alert] = 'Could not send message'
      redirect_to root_new_contact
    end
  end
end
