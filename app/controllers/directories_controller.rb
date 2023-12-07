class DirectoriesController < ApplicationController

    def index
      @directory = Directory.new
      @user = current_user
      @public_directories = Directory.where(private: false)
      @directories_user = @user.directories
      @directories = @public_directories + @directories_user
      snippet_id = params[:snippet_id]
      @selected_snippet = Snippet.find_by(id: snippet_id)
      @search_results = PgSearch.multisearch(params[:query])

      if params[:query].present?
        @search_results = PgSearch.multisearch(params[:query])
      else
        @directories
      end
    end

    def my_directories
      @directory = Directory.new
      @user = current_user
      @directories = @user.directories
      snippet_id = params[:snippet_id]
      @selected_snippet = Snippet.find_by(id: snippet_id)
      @query = params[:query]
      if params[:query].present?
        # Utilisation de l'opérateur de correspondance partielle pour améliorer la recherche
        @search_results = @directories.pg_search_directory(params[:query])
      else
        @directories
      end
    end

    def add_snippet
      @directory = Directory.find(params[:id])
      @snippet = Snippet.find(params[:snippet_id])
      snippet_id = params[:snippet_id]
      @selected_snippet = Snippet.find_by(id: snippet_id)

      unless @directory.snippets.include?(@snippet)
        @directory.snippets << @snippet
        flash[:notice] = 'Snippet added to the directory with success!'
      else
        flash[:alert] = 'This snippet already exists in this directory!'
      end
      redirect_to directory_path(@directory)
    end

    def create_snippet
      @directory = Directory.find(params[:id])
      @new_snippet = @directory.snippets.build(snippet_params)

      if @new_snippet.save
        flash[:notice] = "Snippet created successfully."
      else
        flash[:alert] = "Failed to create snippet."
      end

      redirect_to directory_path(@directory)
    end

    def update_snippet
      @directory = Directory.find(params[:id])
      @snippet = @directory.snippets.find(params[:snippet_id])
      @directories_snippet = DirectoriesSnippet.find_by(directory_id: @directory.id, snippet_id: @snippet.id)

      if @snippet.update(snippet_params)
        flash[:notice] = "Snippet updated successfully in the directory."
      else
        flash[:alert] = "Failed to update snippet in the directory."
      end

      redirect_to directory_path(@directory)
    end



  def show
    @directory = Directory.find(params[:id])
    @snippets = @directory.snippets
    @new_snippet = Snippet.new
    @user = current_user
    @user_snippets = Snippet.where(user: current_user)
    @public_snippets = Snippet.where(private: false)
    @combined_snippets = @user_snippets + @public_snippets

    # Assurez-vous que @snippet est correctement défini, par exemple, en utilisant le premier snippet dans @snippets
    @snippet = @snippets.first
  end

    def new
      @directory = Directory.new
    end

    def create
      @directory = current_user.directories.build(directory_params)
      if @directory.save
        redirect_to my_directories_path(@directory)
        flash[:notice] = "Directory created with success."
      else
        render :new
      end
    end

    def edit
      @directory = Directory.find(params[:id])
      @user = current_user
    end

    def update
      @directory = Directory.find(params[:id])

      if @directory.update(directory_params)
        flash[:notice] = "Directory updated successfully."
      else
        flash[:alert] = "Failed to update directory."
      end

      redirect_to my_directories_path
    end


    def destroy
      @directory = Directory.find(params[:id])
      @directories_snippets = DirectoriesSnippet.where(directory_id: @directory.id)
      @directories_snippets.each do |dir_snip|
        dir_snip.destroy
      end
      @directory.destroy
      redirect_to my_directories_path, notice: 'Directory and associated snippets successfully deleted.'
    end


      def remove_snippet
        @directory = Directory.find(params[:id])
        @snippet = Snippet.find(params[:snippet_id])

        if @directory.snippets.include?(@snippet)
          @directory.snippets.destroy(@snippet)
          flash[:notice] = 'Snippet removed from the directory with success!'
        else
          flash[:alert] = 'This snippet does not exist in this directory!'
        end

        redirect_to directory_path(@directory)
      end


    private

    def directory_params
      params.require(:directory).permit(:name, :private)
    end

    def snippet_params
      params.require(:snippet).permit(:title, :content, :language, :private, :description)
    end

end
