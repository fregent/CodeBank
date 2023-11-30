class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
    @snippet = Snippet.new
    # if params[:query].present?
    #   @snippets = @snippets.where("title ILIKE ?", "%#{params[:query]}%")
    # end
    if params[:query].present?
      @search_results = PgSearch.multisearch(params[:query])
      # raise
    else
      @snippets = Snippet.all
    end
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = current_user.snippets.build(snippet_params)

    if @snippet.save
      redirect_to snippet_path(@snippet)
      flash[:notice] = "Snippet created with success."
    else
      render :new
    end
  end

  def edit
    @snippet = Snippet.find(params[:id])
    @user = current_user
  end

  def update
    @snippet = Snippet.find(params[:id])
    @user = current_user
    @snippet.update(snippet_params)
    redirect_to snippet_path
    flash[:notice] = "Snippet updated with success."
  end


  def destroy
    @snippet = Snippet.find(params[:id])
    @user = current_user
    @user_destroyer = @snippet.user
    @snippet.destroy

    if @user == @user_destroyer
      flash[:notice] = "Snippet deleted with success."
      @snippet.destroy
    end
    redirect_to snippets_path
  end

  private

  def snippet_params
    params.require(:snippet).permit(:name, :content, :language, :private)
  end
end
