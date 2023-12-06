class SnippetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @snippet = Snippet.new
    @user = current_user
    @user_snippets = Snippet.where(user: current_user)
    @public_snippets = Snippet.where(private: false)
    @snippets = @user_snippets + @public_snippets

    if params[:query].present?
      @search_results = PgSearch.multisearch(params[:query])
    else
      @snippets
      @snippets = @snippets.where(language: params[:language]) if params[:language].present?
    end
  end

  def my_snippets
    @snippet = Snippet.new
    @user = current_user
    @snippets = @user.snippets
    # @snippets = Snippet.where(
    #   '(user_id = ?) OR (private = ?)',
    #   current_user.id, false
    # )
    if params[:query].present?
      @search_results = PgSearch.multisearch(params[:query])
    else
      @snippets
      @snippets = @snippets.where(language: params[:language]) if params[:language].present?
    end

  end

def create_snippet_directory
    @directory = Directory.find(params[:snippet][:directory_id])
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user
    if @snippet.save
      @directory_snippet = DirectoriesSnippet.new(directory_id: @directory.id, snippet_id: @snippet.id)
      @directory_snippet.save
      flash[:notice] = "Snippet created and added to the directory with success."
    else
      flash[:alert] = "Failed to create snippet."
    end

    redirect_to directory_path(@directory)
  end

  def add_to_directory
    @snippet = Snippet.find(params[:id])
    @directories = current_user.directories

    # Assure-toi que tu as l'ID du répertoire sélectionné dans les paramètres
    selected_directory_id = params[:directory_id]
    # Vérifie si le snippet n'est pas déjà dans le répertoire sélectionné
    if selected_directory_id && !Directory.find(selected_directory_id).snippets.include?(@snippet)
      # Ajoute le snippet au répertoire sélectionné
      Directory.find(selected_directory_id).snippets << @snippet
      flash[:notice] = 'Snippet added to the directory with success!'
    else
      flash[:alert] = 'This snippet already exists in the selected directory!'
    end
    redirect_to directory_path(selected_directory_id)
  end


  # def save_to_directory
  #   @snippet = Snippet.find(params[:id])
  #   @directory = Directory.find(params[:directory_id])
  #   @directories_user = @user.directories


  # end

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

  def remove_snippet
    @directory = Directory.find(params[:id])
    @snippet = Snippet.find(params[:snippet_id])

    @directories_snippet = DirectoriesSnippet.find_by(directory_id: @directory.id, snippet_id: @snippet.id)

    if @directories_snippet
      @directories_snippet.destroy
      flash[:notice] = 'Snippet removed from the directory with success!'
    else
      flash[:alert] = 'This snippet does not exist in this directory!'
    end

    redirect_to directory_path(@directory)
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

  # def like
  #   @snippet = Snippet.find(params[:id])
  #   @snippet.update(likes: @snippet.likes + 1)
  #   redirect_to snippet_path
  # end

  # def unlike
  #   @snippet = Snippet.find(params[:id])
  #   @snippet.update(likes: @snippet.likes - 1)
  #   redirect_to snippet_path
  # end

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
      :title, :content, :language, :private, :description,
      :shared_count, :likes, :views, :comments_count
    )
  end

  # def like
  #   @snippet = Snippet.find(params[:id])
  #   if current_user.snippets.exclude?(@snippet)
  #       current_user.snippets << @snippet
  #      flash[:success] = "Post added to favorites!"
  #    else
  #      flash[:notice] = "Post already in favorites!"
  #     end
  #     redirect_to @snippet
  #   end


 end
