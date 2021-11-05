class PublicController < ApplicationController
  def index
    # @posts = Post.all
    @posts = Post.where(published: true).order(created_at: :desc)
  end
end
