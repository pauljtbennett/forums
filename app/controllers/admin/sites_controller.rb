class Admin::SitesController < Admin::ApplicationController
  respond_to :html, :json, :xml

  def index
    @sites = Site.all

    respond_with @sites
  end

  def show
    @site = Site.find(params[:id])

    respond_with @site
  end

  def new
    @site = Site.new

    respond_with @site
  end

  def edit
    @site = Site.find(params[:id])

    respond_with @site
  end

  def create
    @site = Site.new(params[:user])

    respond_with @site
  end

  def update
    @site = Site.find(params[:id])

    respond_with @site
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_with @site
  end
end
