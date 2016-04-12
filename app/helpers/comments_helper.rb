module CommentsHelper
	def delete_route(comment)
		comment.commentable_type == "Comment" ? comment_path(comment, comment_id: comment.commentable_id) : comment_path(comment, post_id: comment.commentable_id)
	end
	def edit_route(comment)
		comment.commentable_type == "Comment" ? edit_comment_path(id: comment.id, comment_id: comment.commentable_id) : edit_comment_path(id: comment.id, post_id: comment.commentable_id)
	end
end
