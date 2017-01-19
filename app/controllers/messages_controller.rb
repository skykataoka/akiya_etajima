class MessagesController < ApplicationController
  def index
    @message = Message.new
    if current_user.status_admin?
      @conversation = Conversation.find_by(sender_id: params[:user_id])
      @messages = Message.where("(user_id = ?) OR (user_id = ?)", params[:user_id], User.admin_user)
    else
      @conversation = Conversation.find_or_create_by(sender_id: current_user.id, recipient_id: User.admin_user)
      @messages = Message.where("(user_id = ?) OR (user_id = ?)", current_user.id, User.admin_user)
    end
  end

  def create
    @message = Message.new(messages_params)
    @message.user_id = current_user.id
    if current_user.status_admin?
      @message.conversation_id = Conversation.find_by(sender_id: params[:message][:user_id]).id
    else
      @message.conversation_id = Conversation.find_by(sender_id: current_user.id).id
    end
    @message.save
    redirect_to messages_path(user_id: params[:message][:user_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
    def messages_params
      params.require(:message).permit(:body, :user_id)
    end
end
