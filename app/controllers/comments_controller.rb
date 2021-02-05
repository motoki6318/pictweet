class CommentsController < ApplicationController
  def create
    comment = Comment.create(comments_params)
    redirect_to "/tweets/#{comment.tweet.id}"
  end

  private
  def comments_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end