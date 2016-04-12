class PostsController < ApplicationController

  before_action :authenticate_user!, except: :index
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_commentable, only: [:show]
  def index
    limit = params[:user_id] ? "user_id = #{params[:user_id]}" : ""
    authenticate_user! if limit != ""
    @posts = Post.all.where(limit)
  end

  def show
    @comment = @commentable.comments.new
    @comments = @commentable.comments
    @route = comments_path(post_id: @post.id)
  end

  def new
    user = current_user
    @post = user.posts.new
  end

  def create
    user = current_user
    @post = user.posts.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
     if @post.update(post_params)
      redirect_to @post
     else 
      render 'edit' 
     end 
  end

  def destroy
     json = if @post.destroy
      { json: { post: render_to_string("posts/_post", layout: false, locals:{post: @post}) }}
     end
     render json
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :description, :text)
    end

    def commentable
      id = params[:id]
      Post.find(params[:id])
    end 

    def set_commentable
      @commentable = commentable
    end 
end