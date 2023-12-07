class SnippetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

    @snippet = Snippet.new
    @snippets = Snippet.all.where(private: false)
    @user = current_user
    # @snippets = Snippet.where(
    #   '(user_id = ?) OR (private = ?)',
    #   current_user.id, false
    # )
    if params[:query].present?
      @query = params[:query]
      @search_results = PgSearch.multisearch(@query)
    else
      @snippets
      @snippets = @snippets.where(language: params[:language]) if params[:language].present?
    end

  end

  def my_snippets

    @snippet = Snippet.new
    @user = current_user
    @snippets = @user.snippets
    @query = params[:query]
    @language = params[:language]
    @search_results = nil


    if params[:query].present?
      sql_subquery = "title ILIKE :query OR content ILIKE :query"
      if params[:language]  != "All language"
      @results = @snippets.where(language: params[:language])
      @search_results = @results.where(sql_subquery, query: "%#{params[:query]}%")
      else
        @search_results = @snippets.where(sql_subquery, query: "%#{params[:query]}%")
      end

    elsif !params[:query].present?
    @search_results = @snippets.where(language: params[:language])

    elsif @search_results.nil? || @search_results.empty?
      redirect_to my_snippets_path
      flash[:notice] = "Nothing found for your research."
    else
      redirect_to my_snippets_path
    end
  end




def create_snippet_directory
    @directory = Directory.find(params[:id])
    @snippet = @directory.snippets.build(snippet_params)

    if @snippet.save
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
    @reviews = Review.where(snippet: @snippet)
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
