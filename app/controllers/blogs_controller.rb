class BlogsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.all.includes(:user)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      save_success("投稿しました！")
    else
      render action: :new
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(blog_params)
      save_success("投稿を更新しました！")
    else
      render action: :edit
    end
  end

    private
    def blog_params
      params.require(:blog).permit(
        :title,
        :text
        ).merge(user_id: current_user.id)
    end

    def save_success(message)
      flash[:notice] = message
      redirect_to :root
    end
end
