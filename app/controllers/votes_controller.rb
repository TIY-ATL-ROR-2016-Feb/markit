class VotesController < ApplicationController
  before_action :authenticate!

  def create
    @vote = current_user.votes.new(post_id: params[:post_id],
                                   score: params[:score])
    # @post = Post.find(params[:post_id])
    # @post.votes.create(user_id: current_user.id,
    #                    score: params[:score])
    flash[:notice] = "Errors making vote." if @vote.save
    redirect_to posts_path
  end
end
