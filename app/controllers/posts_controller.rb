class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[show create new ]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    
    @post = current_user.posts.new(postparams)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  

  def postparams
    params.require(:post).permit(:topic, :body, :user_id)
  end

end

