class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def new
    @user = User.new
    edirect_to new_user_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      render 'new'
    end
  end


  def show
    @user = current_user
    @recipes = @user.recipes
  end



  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

end
