class UsersController < ApplicationController

  def show
    @blogs = Blog.where(user_id: params[:id])
  end
end
