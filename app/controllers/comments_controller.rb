class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back fallback_location: root_url, notice: 'Comment was successfully created.'
    else
      redirect_back fallback_location: root_url, :flash => { :warning => 'Comment Faild'}
    end
  end

  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
