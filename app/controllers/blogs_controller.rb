class BlogsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    
  end

  def show
    
  end

  def new
    @blog = Blog.new
  end

  def edit
    
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      save_success("投稿しました！")
    end
  end

  def update
    
  end

    private
    def blog_params
      params.require(:blog).permit(
        :text
        ).merge(user_id: current_user.id)
    end

    def save_success(message)
      flash[:notice] = message
      redirect_to :root
    end
end
