class LikesController < ApplicationController

      def likes_index
        @likes = current_user.likes
      end

      def new_like
        @snippet = Snippet.find(params[:snippet_id])
        @user = current_user
        @like = Like.new(user: @user, snippet: @snippet, like: true)
        if Like.where(user: @user, snippet: @snippet).count == 0
          @like.save
        end
      end

      def likes_params
        params.require(:like).permit(
          :user_id, :snipper_id, :like
        )
      end

      def destroy
        @like = Like.find(params[:id])
        @user = current_user
        @user_destroyer = @like.user
        @like.destroy

        if @user == @user_destroyer
          flash[:notice] = "favorite deleted with success."
          @like.destroy
        end
        redirect_to likes_path
      end
end
