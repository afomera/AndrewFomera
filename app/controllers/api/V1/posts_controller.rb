# Api
module Api
  module V1
    # PostsController
    class PostsController < BaseController
      before_action :set_post, only: %w(show)

      def index
        @posts = Post.published.all
      end

      def show; end

      private

      def set_post
        @post = Post.find(params[:id])
      end
    end
  end
end
