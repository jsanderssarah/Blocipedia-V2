class WikiController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @user = authorize User.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def admin_list
    authorize Wiki # we don't have a particular post to authorize
    # Rest of controller action
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update(wiki_params)
      redirect_to @wiki
    else
      render :edit
  end
end
end
