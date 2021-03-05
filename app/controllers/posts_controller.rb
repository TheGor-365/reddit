class PostsController < ApplicationController

  before_action :authenticate_account!, expect: [ :index, :show ]
  before_action :set_post, only: [ :show ]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.account_id = current_account.id

    if @post.save
      redirect_to community_path(@post.community_id)
    else
      render :new
    end
  end

  def show

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.required(:post).permit(:title, :body)
  end

end
