class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def show

  end


  def edit

  end

  def update
    @post.update(post_params)

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      # re-render the :edit template WITHOUT throwing
      # away the invalid @post
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :category, :content)
  end
end
