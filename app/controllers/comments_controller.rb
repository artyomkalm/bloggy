class CommentsController < ApplicationController
     
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.author = current_user
    redirect_to post_path(@post)
  end

  def edit
  end
    
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'      
    else
      render :edit        
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  private    
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :post_id, :author_id, :approved)
    end
end
