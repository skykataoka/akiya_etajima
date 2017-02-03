class ConversationsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @conversations = Conversation.where.not(sender_id: User.admin_user )
  end

  def create
  end
end
