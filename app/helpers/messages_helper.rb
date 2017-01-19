module MessagesHelper
  def choose_new_or_edit
    if action_name == 'index'
      conversation_messages_path(params[:conversation_id])
    else action_name == 'edit'
      conversation_message_path(params[:conversation_id])
    end
  end
end
