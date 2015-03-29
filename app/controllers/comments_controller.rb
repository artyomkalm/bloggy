class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update]

  def index    
    @comments = @post.comments.all
  end
     
  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user    
    if @comment.save
      redirect_to post_path(@post), notice: "Comment was successfully created."
    else
      render :new
    end
  end

  def edit

  end
    
  def update
    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: 'Comment was successfully updated.'      
    else
      render :edit        
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to comments_url, notice: 'Comment was successfully destroyed.'
  end

  def approve
    @comments = Comment.find(params[:comment_ids])
    @comments.each do |comment|
      comment.update(approved: "true")
    end
    redirect_to post_comments_path
  end
  
  private    
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :post_id, :author_id, :approved)
    end
end
