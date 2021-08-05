class UsersController < ApplicationController
  def index
    @users=User.search(params[:search])
    @users=User.search(params[:search])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(param_user)
    if @user.save
      redirect_to users_path, notice: "User successfuly created"
    else
      render :new
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(param_user)
      redirect_to users_path,notice: "User successfuly updated"
    else
      render :edit
    end
  end
  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to users_path,:notice => "User successfuly deleted"
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def param_user
    params.require(:user).permit(:name, :email, :phone)
  end
end
