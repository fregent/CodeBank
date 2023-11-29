class DirectoriesController < ApplicationController

  def index
    @directories = Directory.all
  end

  def show
    @directory = Directory.find(params[:id])
  end

  def new
    @directory = Directory.new
  end

  def create
    @directory = current_user.directorys.build(directory_params)

    if @directory.save
      redirect_to directory_path(@directory)
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
    redirect_to pages_path, status: :see_other
  end

  private

  def directory_params
    params.require(:directory).permit(:name,)
  end

end
