class ForumsController < ApplicationController
  respond_to :html, :json, :xml

  def index
    @forums = Forum.all
    
    respond_with @forums
  end

  def show
    @forum = Forum.find(params[:id])

    respond_with @forum
  end

  def new
    @forum = Forum.new

    respond_with @forum
  end

  def edit
    @forum = Forum.find(params[:id])

    respond_with @forum
  end

  def create
    @forum = Forum.new(params[:forum])

    respond_with @forum
  end

  def update
    @forum = Forum.find(params[:id])

    respond_with @forum
  end

  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_with @forum
  end
end
