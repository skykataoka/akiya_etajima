class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.where.not(sender_id: User.admin_user )
  end

  def create
  end
end
