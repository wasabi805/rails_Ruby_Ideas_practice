class LikesController < ApplicationController


  def new
    @like = Like.new
    redirect_to 'create'
  end

  def create
    binding.pry
    @like = Like.new(like_params)

    if @like.blank?
      @like.save
      redirect_to bright_ideas_url
    else
      @like.decrement(1)
      redirect_to bright_ideas_url
    end
  end


  def show
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id).slice(:user_id, :post_id)
  end


end
