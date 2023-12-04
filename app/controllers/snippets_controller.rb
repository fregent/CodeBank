class SnippetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @snippet = Snippet.new
    @snippets = Snippet.all
    @user = current_user
    # @snippets = Snippet.where(
    #   '(user_id = ?) OR (private = ?)',
    #   current_user.id, false
    # )
    if params[:query].present?
      @search_results = PgSearch.multisearch(params[:query])
    else
      @snippets
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

  def share
    @snippet = Snippet.find(params[:id])
    @snippet.update(shared_count: @snippet.shared_count + 1)
    redirect_to snippet_path
  end

  def unshare
    @snippet = Snippet.find(params[:id])
    @snippet.update(shared_count: @snippet.shared_count - 1)
    redirect_to snippet_path
  end

  def like
    @snippet = Snippet.find(params[:id])
    @snippet.update(likes: @snippet.likes + 1)
    redirect_to snippet_path
  end

  def unlike
    @snippet = Snippet.find(params[:id])
    @snippet.update(likes: @snippet.likes - 1)
    redirect_to snippet_path
  end

  def comment
    @snippet = Snippet.find(params[:id])
    @snippet.update(comments_count: @snippet.comments_count + 1)
    redirect_to snippet_path
  end

  def last_viewed
    @snippet = Snippet.find(params[:id])
    @snippet.update(last_viewed: Time.now)
    redirect_to snippet_path
  end

  def recently_viewed
    @snippets = Snippet.order(last_viewed: :desc).limit(3)
  end

  private

  def snippet_params
    params.require(:snippet).permit(
      :name, :content, :language, :private, :description,
      :shared_count, :likes, :views, :comments_count
    )
  end
end
