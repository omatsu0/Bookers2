class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit, :update]
  def index
    @book=Book.new
    @users=User.all
  end

  def show
  	@user=User.find(params[:id])
  	@book=Book.new
  	@books=@user.books
  end

  def edit
  	@user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])#更新は、そのidに上書き処理
    if @user.update(user_params)
       redirect_to user_path(@user),notice: "You have updated user successfully."
    else
       render action: :edit
    end
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
  end

  private
	def user_params
		params.require(:user).permit(:name,:profile_image,:introduction,)
	end
end
