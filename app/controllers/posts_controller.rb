class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def process_post
    PostPublishingJob.perform_later
    render plain: "Delayed job"
  end

  # GET /posts or /posts.json
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result().page(params[:page]).per(10)#SIMPLE SEARCH
    
    # @posts = Post.includes(:category).page(params[:page]).per(10)
    # @posts_published = Post.published
    # @posts_unpublished = Post.unpublished
    # @top_5 = Post.limit_5
    # @latest_posts = Post.order_by_latest_first
    # @all_combined = Post.published.order_by_latest_first.limit_5

  end

  # GET /posts/1 or /posts/1.json
  def show
    # render json: @post #in absence of jbuilder

    # render json: @post.as_json(
    #   only: [:id, :title]
    #  include: [:category, {tags: {only: [:name]}}]
    # )

    # respond_to do |format|
    #   format.html
    #   format.json{render json: @post.as_json(
    #     only: [:id, :title],
    #     methods: :post_body,
    #     include: [:category, {tags: {only: [:name]}}]
    #   )}
    # end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :description, :published, :category_id, :all_tags, tag_ids:[])
    end
end
