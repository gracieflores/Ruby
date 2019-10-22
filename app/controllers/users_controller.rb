class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :is_user, except: [:new, :create, :show]

  def new
  end

  def create
    @user = User.create( user_params )
    
    if @user.valid?
      session[:user_id] = @user.id
      flash[:errors] = ["You successfully registered!"]
      redirect_to "/sessions/new"
    else 
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users"
    end
  end

  def show
    @user = User.find(params[:user_id])
    puts @user.likes.count
  end

  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end

  def is_user
    if current_user.id != params[:user_id].to_f
      session.clear
      redirect_to "sessions/new"
    end
  end

end
