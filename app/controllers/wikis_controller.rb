class WikisController < ApplicationController
  before_action :authenticate_user!
  def index
    @wikis = WikiPolicy::Scope.new(current_user, Wiki).resolve
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your Wiki. Try again."
      render :new
    end
  end


  def edit
    @wiki = Wiki.find(params[:id])
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

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "#{@wiki.title} was deleted."
      redirect_to wikis_path
    else
      flash.now[:alert] = "Delete not successful"
      render :show
    end

    private
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
  end
end
