class Admins::SearchesController < ApplicationController

	def search
		@genres = Genre.all
		@user_or_post = params[:case]
		@status = params[:option]
		if @user_or_post == "3" && @status == "1"
			@users = User.search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(10)
		elsif @user_or_post == "3" && @status == "2"
			@users = User.where(status: "有効").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(10)
		elsif @user_or_post == "3" && @status == "3"
			@users = User.where(status: "退会済").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(10)
		elsif @user_or_post == "4" && @status == "4"
			@posts = Post.search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(12)
		elsif @user_or_post == "4" && @status == "5"
			@posts = Post.where(status: "販売中").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(12)
		elsif @user_or_post == "4" && @status == "6"
			@posts = Post.where(status: "販売停止").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(12)
		elsif @user_or_post == "4" && @status == "7"
			@posts = Post.where(status: "売切").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(12)
		elsif @user_or_post == "4" && @status == "8"
			@posts = Post.where(status: "退会済").search(params[:search], @user_or_post).order(id: "DESC").page(params[:page]).per(12)
		end
	end

end