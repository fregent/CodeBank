class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if user_signed_in?
      redirect_to snippets_path
    else
      redirect_to root_path
    end
  end
end
