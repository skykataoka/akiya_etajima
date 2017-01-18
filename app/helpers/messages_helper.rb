module MessagesHelper
  def choose_new_or_edit
    if action_name == 'index'
      user_messages_path
    else action_name == 'edit'
      user_message_path
    end
  end
end
