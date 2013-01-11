class PostsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @posts = Post.find_all_by_conversation_id(params[:conversation_id])

    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @post = Post.new

    if params[:parent]
      @parent = Post.find(params[:parent])
    end    

    respond_with @post
  end

  def edit
    @post = Post.find(params[:id])

    respond_with @post
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @post = Post.new(params[:post])
    @post.conversation = @conversation
    @post.user = current_user

    if params[:parent]
      @post.parent = Post.find(params[:parent])
    end

    if @post.save
      redirect_to forum_conversation_path(@conversation.forum, @conversation)
    else
      render "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.save
      redirect_to forum_conversation_path(@conversation.forum, @conversation)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with @post
  end
end
