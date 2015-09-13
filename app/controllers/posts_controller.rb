class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  def index
    @post = Post.all.order('created_at DESC')
  end

  private
    def post_params
      params.require(:post).permit(:title, :iframe, :description)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
