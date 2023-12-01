class DirectoriesController < ApplicationController

  def index
    @directories = Directory.all
    @directory = Directory.new

    @user = current_user
    # @snippets = Snippet.where(
    #   '(user_id = ?) OR (private = ?)',
    #   current_user.id, false
    # )
    if params[:query].present?
      @search_results = PgSearch.multisearch(params[:query])
    else
      @directories
    end
  end

  def add_snippet
    @directory = Directory.find(params[:id])
    @snippet = Snippet.find(params[:snippet_id])

    unless @directory.snippets.include?(@snippet)
      @directory.snippets << @snippet
      flash[:notice] = 'Snippet added to the directory with success!'
    else
      flash[:alert] = 'This snippet already exists in this directory!'
    end

    redirect_to @directory
  end

  def show
    @directory = Directory.find(params[:id])
    @snippet = Snippet.find(params[:id])
  end


  def new
    @directory = Directory.new
  end

  def create
    @directory = current_user.directories.build(directory_params)

    if @directory.save
      redirect_to directories_path(@directory)
      flash[:notice] = "Directory created with success."
    else
      render :new
    end
  end


  def edit
    @directory = Directory.find(params[:id])
  end

  def update
    @directory = Directory.find(params[:id])
    @directory.update(params[:directory])
  end

  def destroy
    @directory = Directory.find(params[:id])
    @directory.destroy
    redirect_to directory_path, status: :see_other
  end

  private

  def directory_params
    params.require(:directory).permit(:name)
  end

end
