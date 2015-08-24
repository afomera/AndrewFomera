class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :publish]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_admin_status, only: [:new, :edit, :update, :create, :destroy]
  def index
    @posts = Post.published.order("created_at DESC").paginate(page: params[:page], per_page: 10)
    @unpublished_posts = Post.unpublished.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.published = false if save_as_draft?

    if @post.save
      redirect_to @post, notice: "Your new post has been saved!"
    else
      render 'new', notice: "Oh no! An error occurred saving your post!"
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.published = true if publish?
    @post.published = false if save_as_draft?
    if @post.update(post_params)
      redirect_to @post, notice: "Alright! Your article was successfully saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  def publish
    @post.published = true
    if @post.save
      redirect_to @post, notice: "Post has been published!"
    else
      redirect_to @post, notice: "An error occured"
    end
  end
  private

    def post_params
      params.require(:post).permit(:title, :content, :slug)
    end

    def find_post
        @post = Post.friendly.find(params[:id])
    end

    def save_as_draft?
      params[:commit] == "Save as Draft"
    end

    def publish?
      params[:commit] == "Publish"
    end
end
