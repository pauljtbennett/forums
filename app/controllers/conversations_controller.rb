class ConversationsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @conversations = Conversation.find_all_by_forum_id(params[:forum_id])

    respond_with @conversations
  end

  def show
    @conversation = Conversation.find(params[:id])

    respond_with @conversation
  end

  def new
    @conversation = Conversation.new

    respond_with @conversation
  end

  def edit
    @conversation = Conversation.find(params[:id])

    respond_with @conversation
  end

  def create
    @conversation = Conversation.new(params[:conversation])

    respond_with @conversation
  end

  def update
    @conversation = Conversation.find(params[:id])

    respond_with @conversation
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_with @conversation
  end
end
