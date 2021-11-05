class PublicController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.order(created_at: :desc)
  end

  def tags 
    tag = params[:tag]
    # @posts = Post.tags.where(name: tag)
    # render json: @posts
    @posts = Tag.find_by(:name => tag).posts
    render json: @posts
  end
end
