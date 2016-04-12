class CommentsController < ApplicationController

  before_action :authenticate_user!
	before_action :set_commentable, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment_father = @commentable
    @comment = @commentable.comments.new
    @route = comments_path(comment_id: @comment_father.id)
    json = { json: { comment_new: render_to_string("comments/_comment_form", layout: false),  comment_old: @comment_father.text}}
    render json
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    json = if @comment.save
       { json: { comment: render_to_string("comments/_comment", layout: false, locals:{comment: @comment}) }}
    end 
    render json
  end

  def edit
    @route = edit_route(@comment)
    json = { json: { comment_edit: render_to_string("comments/_comment_form", layout: false), comment_old: render_to_string("comments/_comment", layout: false, locals:{comment: @comment, post: @post})}}
    render json
  end

  def update
   	json = if @comment.update(comment_params)
      { json: { comment: render_to_string("comments/_comment_main", layout: false, locals:{comment: @comment}) }}
    end 
    render json
  end

  def destroy
  	json = if @comment.destroy
      { json: { comment_del: render_to_string("comments/_comment", layout: false, locals:{comment: @comment}) }}
    end
    render json   
  end

  private
	  def commentable
	    if params[:post_id]
	      id = params[:post_id]
	      Post.find(params[:post_id])
	    else
	      id = params[:comment_id]
	      Comment.find(params[:comment_id])
	    end
	  end  
	  def set_commentable
	  	@commentable = commentable
	  end 
    def set_comment
    	@comment = @commentable.comments.find(params[:id])
    end
    def comment_params
      params.require(:comment).permit(:text)
    end
    def edit_route(comment)
      comment.commentable_type == "Comment" ? comment_path(comment, comment_id: comment.commentable_id) : comment_path(comment, post_id: comment.commentable_id)
    end
end
