class ContactMessagesController < ApplicationController
  def create
    @message = ContactMessage.new(message_params)
    if @message.valid?
      # TODO send message here
      ApplicationMailer.contact_form_message(@message).deliver
      render "success"
    else
      render "pages/contact"
    end
  end

  private

    def message_params
      params.require(:contact_message).permit(:to, :name, :email, :subject, :body)
    end
end