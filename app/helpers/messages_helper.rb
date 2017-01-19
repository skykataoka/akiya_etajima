module MessagesHelper
  def choose_new_or_edit
    if action_name == 'index'
      messages_path
    else action_name == 'edit'
      message_path
    end
  end
end
