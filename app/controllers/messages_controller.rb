class MessagesController < ApplicationController
  def index
    @message = Message.new
    @current_admin_user_messages = Message.where("(user_id = ?) OR (user_id = ?)", current_user.id, User.admin_user)
  end

  def create
    @message = Message.new(messages_params)
    @message.user_id = current_user.id
    @message.conversation_id = params[:conversation_id]
    @message.save
    redirect_to conversation_messages_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def messages_params
    params.require(:message).permit(:body)
  end
end
