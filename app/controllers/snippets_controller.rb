class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
    @snippet = Snippet.new
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
    else
      render :new
    end
  end



  def edit
    @snippet = Snippet.find(params[:id])
  end

  def update
    @snippet = Snippet.find(params[:id])
    @snippet.update(params[:snippet])
  end

  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy
    redirect_to snippets_path, status: :see_other
  end

  private

  def snippet_params
    params.require(:snippet).permit(:name, :content, :language, :private)
  end

end
