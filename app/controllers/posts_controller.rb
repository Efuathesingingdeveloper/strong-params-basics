class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	
	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
		@post.save
		redirect_to post_path(@post)
	  end
	  
	  def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
	  end
	  
	  private
	  
	  def post_params
		params.require(:post).permit(:title, :description)
	  end 
	end