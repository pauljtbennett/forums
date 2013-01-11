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
    @forum = Forum.find(params[:forum_id])
    @conversation = Conversation.new

    respond_with @conversation
  end

  def edit
    @conversation = Conversation.find(params[:id])

    respond_with @conversation
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @conversation = Conversation.new(params[:conversation])
    @conversation.forum = @forum
    @conversation.user = current_user

    if @conversation.save
      @post = Post.new(params[:post])
      @post.conversation = @conversation
      @post.user = current_user
      @post.save

      redirect_to forum_conversation_path(@forum, @conversation)
    else
      render "new"
    end
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
