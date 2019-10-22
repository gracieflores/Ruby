class PostsController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
    @posts = Post.left_joins(:likes).group(:id).order('COUNT(likes.id) DESC')
  end

  def create
    @post = Post.create( post_params )

    if @post.valid?
      redirect_to '/posts'
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to '/posts'
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    if current_user.id == post.user.id
      post.destroy
      redirect_to "/posts"
    # else
    #   redirect_to "/secrets"
    end
  end

  def show_one
    if Post.find_by(id: params[:post_id])
      @post = Post.find(params[:post_id])
      @likes = @post.users.group(:id)
    end
  end

  private
  def post_params
    params.require(:post).permit(:content).merge(user: User.find(params[:user_id]))
  end

end
