class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
    @snippet = Snippet.new
    @user = current_user
    @user_snippets = @user.snippet
    @snippet_counter = @snippets.count
  end

  def show
    @snippet = Snippet.find(params[:id])
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.save
    redirect_to snippets_path(@snippet)
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
    params.require(:snippet).permit(:name, :content, :private, :language)
  end

end
