class Users::UsersController < ApplicationController

	def index
		@users = User.where(status: true).order(id: "DESC").page(params[:page]).per(10)
	end

	def show
		@user = User.find(params[:id])
		@posts = Post.where(user_id: params[:id]).where.not(status: 1).order(id: "DESC").page(params[:page]).per(12)
	end

	def mypage
		@user = current_user
		@posts = Post.where(user_id: current_user.id).order(id: "DESC").page(params[:page]).per(12)
	end

	def fix
		@user = current_user
	end

	def fix_update
		@user = current_user
		if @user.update(user_params)
			redirect_to users_users_mypage_path
		else
			render :fix
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :user_image, :twitter_account, :instagram_account, :email, :status, :profile)
	end

end
